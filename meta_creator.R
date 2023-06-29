
meta_creator <- function(title, descrip, url, image) {
require(shiny)  
HTML(paste0(
'<!-- HTML Meta Tags -->
<title>', title, '</title>
<meta name="description" content="', descrip, '">

<!-- Google / Search Engine Tags -->
<meta itemprop="name" content="', title, '">
<meta itemprop="description" content="', descrip, '">
<meta itemprop="image" content="', image, '">

<!-- Google / Search Engine Tags -->
<meta name="title" content="', title, '">
<meta name="description" content="', descrip, '">
<meta name="image" content="', image, '">

<!-- Facebook Meta Tags -->
<meta property="og:url" content="', url, '">
<meta property="og:type" content="website">
<meta property="og:title" content="', title, '">
<meta property="og:description" content="', descrip, '">
<meta property="og:image" content="', image, '">

<!-- Twitter Meta Tags -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:url" content="', url, '">
<meta name="twitter:title" content="', title, '">
<meta name="twitter:description" content="', descrip, '">
<meta name="twitter:image" content="', image, '">
'))
  
}

meta_creator("test", "blah", "blah blah", "blah Blah blah")
