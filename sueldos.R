install.packages("rvest")
library(rvest)

LINK <- "https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm"

xmlfile <- read_html(LINK)

tables <- html_nodes(xmlfile, "table")

table1 <- html_table(tables[1], fill =  TRUE)

table <- na.omit(as.data.frame(table1))

str(table)

newSueldo <- gsub("[^[:alnum:][:blank:]?]", "", table$Sueldo)
newSueldo

newSueldo <- gsub("[A-Za-z]", "", newSueldo)
newSueldo

# newSueldo <- gsub("MXN", "", newSueldo)

# newSueldo <- gsub("mes", "", newSueldo)

newSueldo <- as.numeric(newSueldo)
newSueldo

table$Sueldo <- newSueldo

# which.max retonar la posición en donde se encuentra el valor máximo
SUELDOmax <- which.max(table$Sueldo)
SUELDOmax

table[SUELDOmax,]

SUELDOmin <- which.min(table$Sueldo)
SUELDOmin 

table[SUELDOmin,]
