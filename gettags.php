<?php

function slugify($string) {
    $special_chars = array("?", "[", "]","\\", "=", "<", ">", ":", ";", ",", "'", "\"", "&", "$", "#", "*", "(", ")", "|", "~", "`", "!", "{", "}");
    // remove accentuated chars
    $string = htmlentities($string, ENT_QUOTES, 'UTF-8');    
    $string = preg_replace('~&([a-z|A-Z]{1,2})(acute|cedil|circ|grave|lig|orn|ring|slash|th|tilde|uml);~i', '$1', $string);
    $string = html_entity_decode($string, ENT_QUOTES, 'UTF-8');
    // remove special chars
    $string = str_replace($special_chars, '', $string);
    // replace spaces with underscore
    $string = preg_replace('/[\s-]+/', '-', $string);
    // trim the end of the string
    $string = trim($string, '.-_');
    return strtolower($string);
}

$needle = slugify($_GET['q']);

include('libs/dbconnect.php');


$tags = [];
if($db = mysqli_connect (EZSQL_DB_HOST,  EZSQL_DB_USER, EZSQL_DB_PASSWORD, EZSQL_DB_NAME)){    

    if($result = mysqli_query($db, "SELECT * FROM pligg_tags WHERE `tag_words` like '%{$needle}%';")) {

        
        while($row = mysqli_fetch_array ( $result ) ) {
            $pos = strrpos($row['tag_words'],'/');
            if($pos > 0) ++$pos;
            $short = substr($row['tag_words'], $pos);
            $tags[] = array( "id" => $row['tag_words'], "text" => $short);                      
        }
        mysqli_free_result($result);
    }
    mysqli_close($db);
}

// output json result
header('Content-type: application/json; charset=UTF-8');
echo json_encode(array('results' => $tags));