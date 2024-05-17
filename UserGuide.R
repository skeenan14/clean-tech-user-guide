ui <- fluidPage(
  titlePanel("Clean Technology Data Dashboard"),
  tabsetPanel(
    tabPanel("Visualization",
             sidebarLayout(
               sidebarPanel(
                 selectInput("country", "Select Country", choices = unique(data$Country)),
                 checkboxGroupInput("energy_source", "Select Energy Source", choices = names(name_mapping), selected = names(name_mapping)[1:2]),
                 sliderInput("year", "Select Year Range", min = min(data$Year), max = max(data$Year), value = c(min(data$Year), max(data$Year)), step = 1),
                 selectInput("plot_type", "Select Plot Type", choices = c("Line", "Bar")),
                 textInput("annotation", "Add Annotation", ""),
                 checkboxInput("show_table", "Show Data Table", FALSE)
               ),
               mainPanel(
                 plotOutput("energyPlot"),
                 textOutput("plotCaption"),
                 tableOutput("dataTable")
               )
             )
    ),
    tabPanel("User Guide",
             h2("User Guide for the Clean Technology Data Dashboard"),
             p("This interactive dashboard allows you to explore clean technology data across different countries and years."),
             p("Use the controls on the left to customize the visualization:"),
             tags$ul(
               tags$li(strong("Select Country:"), " Choose a country from the dropdown menu."),
               tags$li(strong("Select Energy Source:"), " Check the boxes for the energy sources you want to visualize."),
               tags$li(strong("Select Year Range:"), " Adjust the sliders to set the range of years."),
               tags$li(strong("Select Plot Type:"), " Choose between a line plot and a bar plot."),
               tags$li(strong("Add Annotation:"), " Enter any text to annotate the plot."),
               tags$li(strong("Show Data Table:"), " Check the box to display the underlying data table.")
             )
    )
  )
)

server <- function(input, output) {
  # server logic as previously defined
}

shinyApp(ui = ui, server = server)