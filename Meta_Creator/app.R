library(shiny)
library(shinythemes)


meta_creator <- function(title, descrip, url, image) {
  require(assertive)
  require(shiny)
  assertive::assert_is_a_string(title)
  assertive::assert_is_a_string(descrip)
  assertive::assert_is_a_string(url)
  assertive::assert_is_a_string(image)

  HTML(paste0(
    "<!-- Quick & Dirty HTML Meta Tags -->
<title>", title, '</title>
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
'
  ))
}

ui <- fixedPage(
  tags$head(
    meta_creator(
      "Metatags Creator", "No Fluff Metatag Generator",
      "https://aholmes24.shinyapps.io/Meta_Creator/",
      "https://media.giphy.com/media/gY5sEujrJbCve/giphy.gif"
    ),
    tags$link(rel = "shortcut icon", href = "favicon.ico"),
    tags$style(HTML("
      
      #social {
        border-radius: 10px;
        display: block;
        background-color: #FFFFFF;
        width: 250px;
        height: 265px;
        text-align: left;
        overflow-wrap: break-word;
      }
      #bottomright{
        float: right;
        bottom: 1vh;
      }
      img {
          border-radius: 10px 10px 0px 0px;
      
      }"))
  ),
  theme = shinytheme("united"),
  # Application title
  titlePanel(h1("Metatags Creator", align = "center")),
  br(),
  sidebarLayout(
    sidebarPanel(
      textInput("title", label = "Website Title", placeholder = "Enter the website title"),
      textInput("descrip", label = "Website Description", placeholder = "Enter the description"),
      textInput("url", label = "Website URL", placeholder = "Enter the website URL"),
      textInput("image", label = "Image URL", placeholder = "Enter the image URL"),
      div(align='center',
          h6("Social Card Preview"),
      div(id = "social",
         
        uiOutput("preview_image"),

        h5(textOutput('title')),
        h6(textOutput('descrip'))
        
      
    ))),
    mainPanel(
      verbatimTextOutput("tags")
    ),
    
  ),
  div(id='bottomright',
      tags$a(href="https://github.com/AlexanderHolmes0", "Created by Alex Holmes")
      
  )
)


server <- function(input, output) {
  output$tags <- renderText({
    meta_creator(input$title, input$descrip, input$url, input$image)
  })
  
  output$title <- renderText({
      input$title
  })
  
  output$descrip <- renderText({
      input$descrip
  })
  
  output$preview_image <- renderUI({
    if (!is.null(input$image) && grepl("^https?://", input$image)) {
      tags$img(src = input$image, alt = "Social Card Preview", height = "200px", width = "250px")
    } else {
      tags$img(src = "https://via.placeholder.com/300", alt = "Social Card Preview", height = "200px", width = "250px")
    }
  })
  
}
# Run the application
shinyApp(ui = ui, server = server)
