library(shiny)
library(ggplot2)
library(gridExtra)

load("HMD_DNK_lt.Rdata")


shinyServer(
  
  function(input, output){
  
  output$plot <- renderPlot({
    
        p1 <- ggplot() +
          geom_line(data = subset (DNK2, (Function=="log.mx")),
                    aes(x=Age, y= value, group=YrSx), colour="grey90") +
          geom_line(data = subset (DNK2, (Year==input$year & Function=="log.mx")),
                    aes(x=Age, y= value, colour=Sex)) +
          scale_color_manual(values=c("red", "blue"))+
          coord_cartesian(ylim=c(-11, 0))+
          scale_y_continuous(name="Death rates, log(mx)", breaks=seq(-10, 0, by=2))+
          scale_x_continuous(name="Age", breaks = c (0, 5, seq(10, 110, by=10)))+
          theme(panel.background=element_rect(fill='white'),
                panel.border= element_blank(),
                panel.grid.major = element_line(colour = "grey70", linetype="dotted"),
                legend.text= element_text(size=16, face="bold"), 
                legend.title= element_text(size=16),
                axis.title = element_text(size=16, face="bold"),
                axis.text  = element_text(size=16),
                axis.line.x = element_line(colour = "black"),
                axis.line.y = element_line())
        
        p2 <- ggplot() +
          geom_line(data = subset (DNK2, (Function=="ex")),
                    aes(x=Age, y= value, group=YrSx), colour="grey90") +
          geom_line(data = subset (DNK2, (Year==input$year & Function=="ex")),
                    aes(x=Age, y= value, colour=Sex)) +
          scale_color_manual(values=c("red", "blue"))+
          coord_cartesian(ylim=c(0, 84))+
          scale_y_continuous(name="Remaining life expectancy, ex", breaks=seq(0, 85, by=10))+
          scale_x_continuous(name="Age", breaks = c (0, 5, seq(10, 110, by=10)))+
          theme(panel.background=element_rect(fill='white'),
                panel.border= element_blank(),
                panel.grid.major = element_line(colour = "grey70", linetype="dotted"),
                legend.text= element_text(size=16, face="bold"), 
                legend.title= element_text(size=16),
                axis.title = element_text(size=16, face="bold"),
                axis.text  = element_text(size=16),
                axis.line.x = element_line(colour = "black"),
                axis.line.y = element_line())
        
        p3 <- ggplot() +
          geom_line(data = subset (DNK2, (Function=="lx")),
                    aes(x=Age, y= value/100000, group=YrSx), colour="grey90") +
          geom_line(data = subset (DNK2, (Year==input$year & Function=="lx")),
                    aes(x=Age, y= value/100000, colour=Sex)) +
          scale_color_manual(values=c("red", "blue"))+
          coord_cartesian(ylim=c(0, 1))+
          scale_y_continuous(name="Survivors, lx", breaks=seq(0, 1, by=0.1))+
          scale_x_continuous(name="Age", breaks = c (0, 5, seq(10, 110, by=10)))+
          theme(panel.background=element_rect(fill='white'),
                panel.border= element_blank(),
                panel.grid.major = element_line(colour = "grey70", linetype="dotted"),
                legend.text= element_text(size=16, face="bold"), 
                legend.title= element_text(size=16),
                axis.title = element_text(size=16, face="bold"),
                axis.text  = element_text(size=16),
                axis.line.x = element_line(colour = "black"),
                axis.line.y = element_line())
        
        p4 <- ggplot() +
          geom_line(data = subset (DNK2, (Function=="dx")),
                    aes(x=Age, y= value/100000, group=YrSx), colour="grey90") +
          geom_line(data = subset (DNK2, (Year==input$year & Function=="dx")),
                    aes(x=Age, y= value/100000, colour=Sex)) +
          scale_color_manual(values=c("red", "blue"))+
          coord_cartesian(ylim=c(0, 0.25))+
          scale_y_continuous(name="Deaths, dx", breaks=seq(0, 1, by=0.05))+
          scale_x_continuous(name="Age", breaks = c (0, 5, seq(10, 110, by=10)))+
          theme(panel.background=element_rect(fill='white'),
                panel.border= element_blank(),
                panel.grid.major = element_line(colour = "grey70", linetype="dotted"),
                legend.text= element_text(size=16, face="bold"), 
                legend.title= element_text(size=16),
                axis.title = element_text(size=16, face="bold"),
                axis.text  = element_text(size=16),
                axis.line.x = element_line(colour = "black"),
                axis.line.y = element_line())
        
        grid.arrange(p1, p2, p3, p4, ncol=2)
        
      })
    }
  )
    


