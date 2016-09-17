<?php



// Here are the server environment vars we use and some examples of typical values
// $_SERVER['SCRIPT_NAME']		ex.: /easyobject/url_resolve.php
// $_SERVER['REQUEST_URI']		ex.: /easyobject/en/presentation/project, /easyobject/en/presentation/index.php?show=icway_site&page_id=6&lang=en
// $_SERVER['HTTP_REFERER']		ex.: http://localhost/easyobject/en/presentation/project


// get the base directory of the current script (easyObject directory being considered as root for URL redirection)
$base = substr($_SERVER['SCRIPT_NAME'], 0, strrpos($_SERVER['SCRIPT_NAME'], '/')+1);
// note: in our example, $base should now contain '/easyobject/'


// we assume URL do not include sub-directories notation (ie: no '/')

/**
* Get a clean version of the request URI
*/
$request_uri = $_SERVER['REQUEST_URI'];
$request_uri = substr($request_uri, strrpos($request_uri, '/')+1); 
// remove everything after question mark, if any
if(($pos = strpos($request_uri, '?')) !== false) $request_uri = substr($request_uri, 0, $pos);

$request_uri = trim($request_uri, " -");

include('libs/dbconnect.php');
$found = false;

if($db = mysqli_connect (EZSQL_DB_HOST,  EZSQL_DB_USER, EZSQL_DB_PASSWORD, EZSQL_DB_NAME)){    
    if($result = mysqli_query($db, "SELECT * FROM pligg_links WHERE `link_title_url` = '".$request_uri."';")) {
        if($row = mysqli_fetch_array ( $result ) ) {
            $found = true;
        }
        mysqli_free_result($result);
    }
    mysqli_close($db);
}
    
if($found) {
    /*
    $additional_params = array_merge($additional_params, extract_params($complete_url));
	// set the global var '$_REQUEST' (if a param is already set, its value is overwritten)
	foreach($additional_params as $key => $value) $_REQUEST[$key] = $value;
    */
    $_SERVER["SCRIPT_NAME"] = $base.'story.php';
    $_REQUEST['title'] = $_GET['title'] = $request_uri;
    
    
	// set the header to HTTP 200 and relay processing to index.php
	header('HTTP/1.0 200 OK');
	header('Status: 200 OK');
	// continue as usual
	include_once('story.php');
}
// page not found
else {
	// set the header to HTTP 404 and exit
	header('HTTP/1.0 404 Not Found');
	header('Status: 404 Not Found');
	include_once('error_404.php');
}
