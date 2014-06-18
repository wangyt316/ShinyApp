dataclean <- function(df){
        df$ReportPeriod = as.Date(df$ReportPeriod, '%m/%d/%Y')
        df = df[, 2:6]
        df$Year = format(df$ReportPeriod, '%Y')
        df = df[-which(df$Terminal == 'Imperial Terminal'),]
        df = df[-which(df$Terminal == 'Misc. Terminal'),]
        return(df)
}

roseGraph <- function(df, year){
        yearly = df[df$Year == year, ]
        terminal = with(yearly, aggregate(Passenger_Count, data.frame(yearly$Terminal), sum))
        terminal$x = terminal$x/1000000
        ymax = max(terminal$x)
        library(ggplot2)
        ps1 = ggplot(terminal, aes(as.factor(yearly.Terminal), x, fill = as.factor(yearly.Terminal))) + geom_bar(stat = 'identity')
        ps1 = ps1 + coord_polar() + 
                theme_bw() + 
                labs(x = 'Termianl', y = 'Passenger Traffic (in million)')+ 
                ylim(0,ymax) + ggtitle("2013")+ 
                theme(legend.position = 'none',legend.title = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), panel.border = element_blank()) 
        return(ps1)
        
        
}
