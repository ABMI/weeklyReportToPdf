require('knitr')
require('rmarkdown')

header = '<!DOCTYPE html>
    <html lang="en">
    <head>
    <meta charset="UTF-8">
    </head>
    <style>
      pre {
        font-size: 15px;
        border-bottom: solid;
        border-bottom-width: 1px;
      }

      pre:last-child {
        border-bottom: none;
      }

      table {
        border-collapse: collapse;
      }

      tr {
        border: solid;
        border-width: 1px 1px;
      }

      th {
        font-weight: bold;
        font-size: 20px;
      }

      td, th {
        font-size: 20px;
        border: solid;
        border-width: 1px;
      }
    </style>
    <body>'

header <- sub('\"en\"',"en",header)
header <- sub('\"UTF-8\"',"UTF-8",header)


# read .md file
mdFileName <- list.files(getwd())[which(grepl(pattern = '.md',x = list.files('./')))]


for(k in 1:length(mdFileName)){
  
  # file name without file format
  headName <- substr(mdFileName[k],start = 1,stop = nchar(mdFileName[k])-3)
  
  # read .md file
  mdFile <- read.table(file = file.path(getwd(),mdFileName[k]),header = F,sep = '\n',encoding = 'UTF-8')
  # dataframe to vector
  mdFile <- mdFile[[1]]
  
  # divide \n
  myBody <- paste(mdFile,collapse = '\n')
  myBody <- strsplit(x = myBody,split = '\n')
  
  #PreProcessing
  ##bold
  myBody <- unlist(lapply(myBody, function(x) sub('[*]{2,2}','<strong>',x)))
  myBody <- unlist(lapply(myBody, function(x) sub('[*]{2,2}','</strong>',x)))
  ##list
  myBody <- unlist(lapply(myBody, function(x) sub('  -','&emsp;-',x)))
  myBody <- unlist(lapply(myBody, function(x) sub('    -','&emsp;&emsp;-',x)))
  myBody <- unlist(lapply(myBody, function(x) sub('      -','&emsp;&emsp;&emsp;-',x)))
  
  ##Strikethrough
  for(i in 1:length(myBody)){
    if(length(gregexpr('~',myBody[i])[[1]]) ==2){
      myBody[i] <- sub('~','<del>',myBody[i])
      myBody[i] <- sub('~','</del>',myBody[i])
    }
    
  }
  # divide text by <br> tag
  myBody <- paste(myBody,collapse = '<br>')

  # Remove <br> Between title and text
  for(n in 1:10){
    myBody <- sub(pattern = '<br>',replacement = '',myBody)
  }
  
  #close tag
  myBody <- paste(myBody,'<br></body></html>')
  
  
  # header <- gsub(pattern = '\n','',header)
  # add Title by file name
  myMdFile <- paste(header,'<h1>', headName,'</h1>',myBody)
  
  #make html file
  write.table(x = myMdFile,file = paste0('./',headName,'.html'),quote = F,row.names = F,col.names = F,fileEncoding = 'UTF-8')
  
  #html to pdf
  myFile=paste0('./',headName,'.html')
  wkhtmltopdf_exe="C:/Programs/wkhtmltopdf/bin/wkhtmltopdf.exe"
  save_as=paste0('./',headName,'.pdf')
  x=paste0(wkhtmltopdf_exe," --encoding 'UTF-8' ",myFile," ",save_as)
  system(x)
  #remove html
  system(paste0('rm ',headName,'.html'))
}





