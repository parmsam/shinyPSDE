#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic 
    bs4Dash::dashboardPage(
      header = bs4Dash::dashboardHeader(title = "shinyPSDE"),
      bs4Dash::bs4DashSidebar(
        bs4Dash::bs4SidebarMenu(
          bs4Dash::bs4SidebarMenuItem("explorer"),
          bs4Dash::bs4SidebarMenuItem("usage")
        )
      ),
      bs4Dash::dashboardBody(
        shiny::fluidRow(
          bs4Dash::bs4Sortable(
            bs4Dash::bs4Card(
              title = "Controls",
              status = "primary",
              brandColor = "primary"
              # TODO - controls module goes here
            ),
            bs4Dash::bs4Card(
              title = "Plot",
              status = "success",
              brandColor = "success"
              # TODO - plot module goes here
            ),
            bs4Dash::bs4Card(
              title = "Data",
              status = "success",
              brandColor = "success"
              # TODO - data view module goes here
            )
          )
        )
      )
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'shinyPSDE'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

