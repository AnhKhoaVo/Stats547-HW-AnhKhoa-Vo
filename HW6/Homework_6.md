Homework\_6
================
Anh Khoa Vo
November 9, 2017

Question 1: StringR in data science
===================================

14.2.5
======

1.  The difference between paste() and paste0() lies on the "sep" argument of the function. sep is used to separate every term in the vector. By default, paste() will separate each elemenents in the string with a space, whereas paste0() link string without spaces. For example:

``` r
My_name <- c("A", "n", "h")
My_name_changed <- paste(My_name)
My_name_changed
```

    ## [1] "A" "n" "h"

``` r
My_name2 <- paste0(My_name)
My_name2
```

    ## [1] "A" "n" "h"

Paste0() is equivalent to str\_c(), and paste() is equivalent to str\_c(, sep = "")

1.  The sep argument in str\_c() will insert strings between input vectors, but the collapse argument in str\_c() will concatenate input vectors into a single string. For example,

``` r
library(stringr)
My_Full_Name <- c("A", "n", "h", "K", "h", "o", "a", "V", "o")
str_c(My_Full_Name, sep = "")
```

    ## [1] "A" "n" "h" "K" "h" "o" "a" "V" "o"

``` r
str_c(My_Full_Name, collapse = "")
```

    ## [1] "AnhKhoaVo"

1.  

``` r
df <- c("Is R really fun")
str_length(df)
```

    ## [1] 15

``` r
str_sub(df, 7, 7)
```

    ## [1] "e"

1.  str\_wrap() is used to edit the existing whitespace to wrap a paragraphs in a way that each line has similar lengths to each other. You might use this function in graph, such as ggplot that has a long varibles' names in the Axis.

2.  str\_trim() is used to remove any leading and trailing whitespace. The opposite of str\_trim() is str\_pad(), which adds extra whitespace on the left, right, or both to a string.

3.  Write function:

``` r
library(stringr)
Vector_string <- function(x) {
  l <- length(x)
  if (l == 0) return("")
  if (l == 1) return(x)
  if (l == 2) return(str_c(x, collapse = " and "))
  if (l >= 3){ 
    n <- x[l]
    k <- c("and", n)
    x[l] <- str_c(k, collapse = " ")
    return(str_c(x, collapse = ", "))
  }
}
o <- c("a", "b", "c")
h <- Vector_string(o)
h
```

    ## [1] "a, b, and c"

14.3.1.1
========

1.  These strings don't match a  because "" is used to escape behaviour, whereas "\\" is to create regular expression. In order to create said regular expression, we need to use a string, which adds another "". In other words, to create "" we need 4 "\\\\".

2.  

``` r
library(stringr)
l = "\"'\\"
writeLines(l)
```

    ## "'\

``` r
str_view(l, "\\\"'\\\\")
```

<!--html_preserve-->

<script type="application/json" data-for="htmlwidget-46cd91915b9911e6223f">{"x":{"html":"<ul>\n  <li><span class='match'>\"'\\<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>
<!--/html_preserve-->
14.3.2.1
========

1.  

``` r
k = "IsRreally$^$FUNNNNNNNMAYBE"
str_view(k, "\\$\\^\\$")
```

<!--html_preserve-->

<script type="application/json" data-for="htmlwidget-55a875f9565138872f63">{"x":{"html":"<ul>\n  <li>IsRreally<span class='match'>$^$<\/span>FUNNNNNNNMAYBE<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>
<!--/html_preserve-->
14.3.3.1
========

1.  

``` r
wordss <- c("color", "colour")
str_view(wordss, "ou", match = T)
```

<!--html_preserve-->

<script type="application/json" data-for="htmlwidget-8079c8a71266f5edbbbf">{"x":{"html":"<ul>\n  <li>col<span class='match'>ou<\/span>r<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>
<!--/html_preserve-->
14.3.4.1
========

1.  {1}, {1,}, {0,}

14.3.5.1
========

1.  

``` r
wordsss <- c("ana", "anh", "decide", "table", "degree", "eleven", "one", "two")
str_view(wordsss, "^(.).*\\1$", match = T)
```

<!--html_preserve-->

<script type="application/json" data-for="htmlwidget-05857acb3793a156efdb">{"x":{"html":"<ul>\n  <li><span class='match'>ana<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>
<!--/html_preserve-->
``` r
str_view(wordsss, "(..).*\\1", match = T)
```

<!--html_preserve-->

<script type="application/json" data-for="htmlwidget-95ef73996fc3eecc23c3">{"x":{"html":"<ul>\n  <li><span class='match'>decide<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>
<!--/html_preserve-->
``` r
str_view(wordsss, "(.).*\\1.*\\1", match = T)
```

<!--html_preserve-->

<script type="application/json" data-for="htmlwidget-3f75e867a3a99c99505a">{"x":{"html":"<ul>\n  <li>d<span class='match'>egree<\/span><\/li>\n  <li><span class='match'>eleve<\/span>n<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>
<!--/html_preserve-->
14.4.2
======

1.  

``` r
str_view(words, "^x|x$", match = T)
```

<!--html_preserve-->

<script type="application/json" data-for="htmlwidget-019d6384b04a30d6807d">{"x":{"html":"<ul>\n  <li>bo<span class='match'>x<\/span><\/li>\n  <li>se<span class='match'>x<\/span><\/li>\n  <li>si<span class='match'>x<\/span><\/li>\n  <li>ta<span class='match'>x<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>
<!--/html_preserve-->
``` r
start_x = str_detect(words, "^x")
end_x = str_detect(words, "x$")
words[start_x | end_x]
```

    ## [1] "box" "sex" "six" "tax"

``` r
str_view(words, "^[aeuio].*[^aeuio]$", match = T)
```

<!--html_preserve-->

<script type="application/json" data-for="htmlwidget-616908d8dfdaed583e2e">{"x":{"html":"<ul>\n  <li><span class='match'>about<\/span><\/li>\n  <li><span class='match'>accept<\/span><\/li>\n  <li><span class='match'>account<\/span><\/li>\n  <li><span class='match'>across<\/span><\/li>\n  <li><span class='match'>act<\/span><\/li>\n  <li><span class='match'>actual<\/span><\/li>\n  <li><span class='match'>add<\/span><\/li>\n  <li><span class='match'>address<\/span><\/li>\n  <li><span class='match'>admit<\/span><\/li>\n  <li><span class='match'>affect<\/span><\/li>\n  <li><span class='match'>afford<\/span><\/li>\n  <li><span class='match'>after<\/span><\/li>\n  <li><span class='match'>afternoon<\/span><\/li>\n  <li><span class='match'>again<\/span><\/li>\n  <li><span class='match'>against<\/span><\/li>\n  <li><span class='match'>agent<\/span><\/li>\n  <li><span class='match'>air<\/span><\/li>\n  <li><span class='match'>all<\/span><\/li>\n  <li><span class='match'>allow<\/span><\/li>\n  <li><span class='match'>almost<\/span><\/li>\n  <li><span class='match'>along<\/span><\/li>\n  <li><span class='match'>already<\/span><\/li>\n  <li><span class='match'>alright<\/span><\/li>\n  <li><span class='match'>although<\/span><\/li>\n  <li><span class='match'>always<\/span><\/li>\n  <li><span class='match'>amount<\/span><\/li>\n  <li><span class='match'>and<\/span><\/li>\n  <li><span class='match'>another<\/span><\/li>\n  <li><span class='match'>answer<\/span><\/li>\n  <li><span class='match'>any<\/span><\/li>\n  <li><span class='match'>apart<\/span><\/li>\n  <li><span class='match'>apparent<\/span><\/li>\n  <li><span class='match'>appear<\/span><\/li>\n  <li><span class='match'>apply<\/span><\/li>\n  <li><span class='match'>appoint<\/span><\/li>\n  <li><span class='match'>approach<\/span><\/li>\n  <li><span class='match'>arm<\/span><\/li>\n  <li><span class='match'>around<\/span><\/li>\n  <li><span class='match'>art<\/span><\/li>\n  <li><span class='match'>as<\/span><\/li>\n  <li><span class='match'>ask<\/span><\/li>\n  <li><span class='match'>at<\/span><\/li>\n  <li><span class='match'>attend<\/span><\/li>\n  <li><span class='match'>authority<\/span><\/li>\n  <li><span class='match'>away<\/span><\/li>\n  <li><span class='match'>awful<\/span><\/li>\n  <li><span class='match'>each<\/span><\/li>\n  <li><span class='match'>early<\/span><\/li>\n  <li><span class='match'>east<\/span><\/li>\n  <li><span class='match'>easy<\/span><\/li>\n  <li><span class='match'>eat<\/span><\/li>\n  <li><span class='match'>economy<\/span><\/li>\n  <li><span class='match'>effect<\/span><\/li>\n  <li><span class='match'>egg<\/span><\/li>\n  <li><span class='match'>eight<\/span><\/li>\n  <li><span class='match'>either<\/span><\/li>\n  <li><span class='match'>elect<\/span><\/li>\n  <li><span class='match'>electric<\/span><\/li>\n  <li><span class='match'>eleven<\/span><\/li>\n  <li><span class='match'>employ<\/span><\/li>\n  <li><span class='match'>end<\/span><\/li>\n  <li><span class='match'>english<\/span><\/li>\n  <li><span class='match'>enjoy<\/span><\/li>\n  <li><span class='match'>enough<\/span><\/li>\n  <li><span class='match'>enter<\/span><\/li>\n  <li><span class='match'>environment<\/span><\/li>\n  <li><span class='match'>equal<\/span><\/li>\n  <li><span class='match'>especial<\/span><\/li>\n  <li><span class='match'>even<\/span><\/li>\n  <li><span class='match'>evening<\/span><\/li>\n  <li><span class='match'>ever<\/span><\/li>\n  <li><span class='match'>every<\/span><\/li>\n  <li><span class='match'>exact<\/span><\/li>\n  <li><span class='match'>except<\/span><\/li>\n  <li><span class='match'>exist<\/span><\/li>\n  <li><span class='match'>expect<\/span><\/li>\n  <li><span class='match'>explain<\/span><\/li>\n  <li><span class='match'>express<\/span><\/li>\n  <li><span class='match'>identify<\/span><\/li>\n  <li><span class='match'>if<\/span><\/li>\n  <li><span class='match'>important<\/span><\/li>\n  <li><span class='match'>in<\/span><\/li>\n  <li><span class='match'>indeed<\/span><\/li>\n  <li><span class='match'>individual<\/span><\/li>\n  <li><span class='match'>industry<\/span><\/li>\n  <li><span class='match'>inform<\/span><\/li>\n  <li><span class='match'>instead<\/span><\/li>\n  <li><span class='match'>interest<\/span><\/li>\n  <li><span class='match'>invest<\/span><\/li>\n  <li><span class='match'>it<\/span><\/li>\n  <li><span class='match'>item<\/span><\/li>\n  <li><span class='match'>obvious<\/span><\/li>\n  <li><span class='match'>occasion<\/span><\/li>\n  <li><span class='match'>odd<\/span><\/li>\n  <li><span class='match'>of<\/span><\/li>\n  <li><span class='match'>off<\/span><\/li>\n  <li><span class='match'>offer<\/span><\/li>\n  <li><span class='match'>often<\/span><\/li>\n  <li><span class='match'>okay<\/span><\/li>\n  <li><span class='match'>old<\/span><\/li>\n  <li><span class='match'>on<\/span><\/li>\n  <li><span class='match'>only<\/span><\/li>\n  <li><span class='match'>open<\/span><\/li>\n  <li><span class='match'>opportunity<\/span><\/li>\n  <li><span class='match'>or<\/span><\/li>\n  <li><span class='match'>order<\/span><\/li>\n  <li><span class='match'>original<\/span><\/li>\n  <li><span class='match'>other<\/span><\/li>\n  <li><span class='match'>ought<\/span><\/li>\n  <li><span class='match'>out<\/span><\/li>\n  <li><span class='match'>over<\/span><\/li>\n  <li><span class='match'>own<\/span><\/li>\n  <li><span class='match'>under<\/span><\/li>\n  <li><span class='match'>understand<\/span><\/li>\n  <li><span class='match'>union<\/span><\/li>\n  <li><span class='match'>unit<\/span><\/li>\n  <li><span class='match'>university<\/span><\/li>\n  <li><span class='match'>unless<\/span><\/li>\n  <li><span class='match'>until<\/span><\/li>\n  <li><span class='match'>up<\/span><\/li>\n  <li><span class='match'>upon<\/span><\/li>\n  <li><span class='match'>usual<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>
<!--/html_preserve-->
``` r
start_vowel = str_detect(words, "^[aeuio]")
end_consonant = str_detect(words, "[^aeuio]$")
words[start_vowel & end_consonant]
```

    ##   [1] "about"       "accept"      "account"     "across"      "act"        
    ##   [6] "actual"      "add"         "address"     "admit"       "affect"     
    ##  [11] "afford"      "after"       "afternoon"   "again"       "against"    
    ##  [16] "agent"       "air"         "all"         "allow"       "almost"     
    ##  [21] "along"       "already"     "alright"     "although"    "always"     
    ##  [26] "amount"      "and"         "another"     "answer"      "any"        
    ##  [31] "apart"       "apparent"    "appear"      "apply"       "appoint"    
    ##  [36] "approach"    "arm"         "around"      "art"         "as"         
    ##  [41] "ask"         "at"          "attend"      "authority"   "away"       
    ##  [46] "awful"       "each"        "early"       "east"        "easy"       
    ##  [51] "eat"         "economy"     "effect"      "egg"         "eight"      
    ##  [56] "either"      "elect"       "electric"    "eleven"      "employ"     
    ##  [61] "end"         "english"     "enjoy"       "enough"      "enter"      
    ##  [66] "environment" "equal"       "especial"    "even"        "evening"    
    ##  [71] "ever"        "every"       "exact"       "except"      "exist"      
    ##  [76] "expect"      "explain"     "express"     "identify"    "if"         
    ##  [81] "important"   "in"          "indeed"      "individual"  "industry"   
    ##  [86] "inform"      "instead"     "interest"    "invest"      "it"         
    ##  [91] "item"        "obvious"     "occasion"    "odd"         "of"         
    ##  [96] "off"         "offer"       "often"       "okay"        "old"        
    ## [101] "on"          "only"        "open"        "opportunity" "or"         
    ## [106] "order"       "original"    "other"       "ought"       "out"        
    ## [111] "over"        "own"         "under"       "understand"  "union"      
    ## [116] "unit"        "university"  "unless"      "until"       "up"         
    ## [121] "upon"        "usual"

14.4.4.1
========

1.  

``` r
contraction = str_subset(sentences, "[^ ]+\\'[^ .]+")
str_extract(contraction, "[^ ]+\\'[^ .]+")
```

    ##  [1] "It's"       "man's"      "don't"      "store's"    "workmen's" 
    ##  [6] "Let's"      "sun's"      "child's"    "king's"     "It's"      
    ## [11] "don't"      "queen's"    "don't"      "pirate's"   "neighbor's"

14.4.5.1
========

1.  

``` r
K = "AnhKhoaVo//REALLY//enjoys/////R///right////now//cant/wait/to/die"
str_replace_all(K, "/", "\\\\")
```

    ## [1] "AnhKhoaVo\\\\REALLY\\\\enjoys\\\\\\\\\\R\\\\\\right\\\\\\\\now\\\\cant\\wait\\to\\die"

14.4.6.1
========

1.  

``` r
froots = "apples, pears, and bananas"
str_split(froots, ", and |, ")
```

    ## [[1]]
    ## [1] "apples"  "pears"   "bananas"

14.5.1
======

``` r
dying = c("I\\", "am\\", "seriously\\", "dying\\", "right\\", "now\\", "Icantdeal\\")
str_view(dying, regex("\\\\"))
```

<!--html_preserve-->

<script type="application/json" data-for="htmlwidget-7d9d89338a956a5151bd">{"x":{"html":"<ul>\n  <li>I<span class='match'>\\<\/span><\/li>\n  <li>am<span class='match'>\\<\/span><\/li>\n  <li>seriously<span class='match'>\\<\/span><\/li>\n  <li>dying<span class='match'>\\<\/span><\/li>\n  <li>right<span class='match'>\\<\/span><\/li>\n  <li>now<span class='match'>\\<\/span><\/li>\n  <li>Icantdeal<span class='match'>\\<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>
<!--/html_preserve-->
``` r
str_view(dying, fixed("\\"))
```

<!--html_preserve-->

<script type="application/json" data-for="htmlwidget-2105a087622f4ccc9a68">{"x":{"html":"<ul>\n  <li>I<span class='match'>\\<\/span><\/li>\n  <li>am<span class='match'>\\<\/span><\/li>\n  <li>seriously<span class='match'>\\<\/span><\/li>\n  <li>dying<span class='match'>\\<\/span><\/li>\n  <li>right<span class='match'>\\<\/span><\/li>\n  <li>now<span class='match'>\\<\/span><\/li>\n  <li>Icantdeal<span class='match'>\\<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>
<!--/html_preserve-->
14.7
====

1.  Count the number of words. stri\_count\_words
2.  Find duplicated strings. stri\_duplicated
3.  Generate random text. stri\_rand\_strings

Question 2: Write own function
==============================

``` r
library("gapminder")
```

    ## Warning: package 'gapminder' was built under R version 3.4.2

``` r
fit.model <- function(dat) {
  base_model <- lm(lifeExp ~ year + I(year^2) + pop, dat)
  full_model <- lm(lifeExp ~ year + I(year^2) + pop + gdpPercap + factor(continent), dat)
  x <- anova(base_model, full_model)
  return(list(x,base_model, full_model))
}

f <- fit.model(gapminder)
f
```

    ## [[1]]
    ## Analysis of Variance Table
    ## 
    ## Model 1: lifeExp ~ year + I(year^2) + pop
    ## Model 2: lifeExp ~ year + I(year^2) + pop + gdpPercap + factor(continent)
    ##   Res.Df    RSS Df Sum of Sq      F    Pr(>F)    
    ## 1   1700 228545                                  
    ## 2   1695  78816  5    149729 644.01 < 2.2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## [[2]]
    ## 
    ## Call:
    ## lm(formula = lifeExp ~ year + I(year^2) + pop, data = dat)
    ## 
    ## Coefficients:
    ## (Intercept)         year    I(year^2)          pop  
    ##  -1.425e+04    1.414e+01   -3.490e-03    3.610e-09  
    ## 
    ## 
    ## [[3]]
    ## 
    ## Call:
    ## lm(formula = lifeExp ~ year + I(year^2) + pop + gdpPercap + factor(continent), 
    ##     data = dat)
    ## 
    ## Coefficients:
    ##               (Intercept)                       year  
    ##                -1.465e+04                  1.456e+01  
    ##                 I(year^2)                        pop  
    ##                -3.606e-03                  1.850e-09  
    ##                 gdpPercap  factor(continent)Americas  
    ##                 3.000e-04                  1.428e+01  
    ##     factor(continent)Asia    factor(continent)Europe  
    ##                 9.363e+00                  1.934e+01  
    ##  factor(continent)Oceania  
    ##                 2.053e+01

``` r
library("dplyr")
```

    ## Warning: package 'dplyr' was built under R version 3.4.2

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library("tidyverse")
```

    ## Warning in sample.int(.Machine$integer.max - 1L, 1L): '.Random.seed' is not
    ## an integer vector but of type 'NULL', so ignored

    ## -- Attaching packages ---------------------------------------------------------- tidyverse 1.2.0 --

    ## v ggplot2 2.2.1     v readr   1.1.1
    ## v tibble  1.3.4     v purrr   0.2.4
    ## v tidyr   0.7.2     v forcats 0.2.0

    ## Warning: package 'tibble' was built under R version 3.4.2

    ## Warning: package 'tidyr' was built under R version 3.4.2

    ## Warning: package 'purrr' was built under R version 3.4.2

    ## Warning: package 'forcats' was built under R version 3.4.2

    ## -- Conflicts ------------------------------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
resid.model <- function(fit) {
  z <- qqnorm(resid(fit[[2]]))
  t <- qqnorm(resid(fit[[3]]))
  df1 <- data.frame(x = z$x, y = z$y, lab = "Residuals Base")
  df2 <- data.frame(x = t$x, y = t$y, lab = "Residuals Full")
  u <- dplyr::union(df1, df2)
  i <- arrange(u, lab)
  return(i)
}

g <- resid.model(f)
```

![](Homework_6_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-14-1.png)

    ## Warning: Column `lab` joining factors with different levels, coercing to
    ## character vector

![](Homework_6_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-14-2.png)

``` r
g
```

    ##                  x             y            lab
    ## 1     1.4704795330  15.094533108 Residuals Base
    ## 2     0.1722221170   4.384639818 Residuals Base
    ## 3     0.8549015837  11.840738417 Residuals Base
    ## 4     1.2170332922  13.838518744 Residuals Base
    ## 5    -0.8111953055 -11.272594044 Residuals Base
    ## 6    -0.5137963699  -7.450152701 Residuals Base
    ## 7     2.5027302423  20.526694078 Residuals Base
    ## 8     1.4325191375  14.967334211 Residuals Base
    ## 9     0.4937554869   8.420031821 Residuals Base
    ## 10    0.7611018357  11.167222740 Residuals Base
    ## 11    0.1707293042   4.378598070 Residuals Base
    ## 12    0.5856680754   9.362528640 Residuals Base
    ## 13   -0.6245339289  -8.889485872 Residuals Base
    ## 14    1.2420940112  13.970911743 Residuals Base
    ## 15    1.0216958358  12.853789687 Residuals Base
    ## 16   -0.1379774796  -1.899055739 Residuals Base
    ## 17    0.1364925358   3.740016788 Residuals Base
    ## 18    1.0699886599  13.101296036 Residuals Base
    ## 19   -0.7415940439 -10.351187079 Residuals Base
    ## 20   -0.1543326968  -2.169158270 Residuals Base
    ## 21    0.4266957603   7.710635373 Residuals Base
    ## 22    1.8606513573  16.910374053 Residuals Base
    ## 23   -0.2595799635  -4.049454771 Residuals Base
    ## 24    1.4533494264  15.025613568 Residuals Base
    ## 25   -0.9733103881 -12.807990517 Residuals Base
    ## 26   -1.9815001616 -21.869521156 Residuals Base
    ## 27    1.3548370370  14.473473541 Residuals Base
    ## 28   -1.0699886599 -13.737429775 Residuals Base
    ## 29   -1.4748301398 -17.729306116 Residuals Base
    ## 30    0.3883325489   7.243012573 Residuals Base
    ## 31   -0.4396214981  -6.592940613 Residuals Base
    ## 32   -0.3458438165  -5.442366477 Residuals Base
    ## 33   -0.4640587788  -6.786567726 Residuals Base
    ## 34   -0.7611018357 -10.678171499 Residuals Base
    ## 35    1.3294927807  14.302400844 Residuals Base
    ## 36    0.9003054032  12.133862771 Residuals Base
    ## 37   -0.0286889416   0.532547091 Residuals Base
    ## 38   -0.9476456874 -12.609638222 Residuals Base
    ## 39   -1.6604150432 -19.285035375 Residuals Base
    ## 40   -1.1546361986 -14.723222203 Residuals Base
    ## 41    1.2614142846  14.041463948 Residuals Base
    ## 42   -0.3333769433  -5.235939766 Residuals Base
    ## 43    0.4170481453   7.600610619 Residuals Base
    ## 44    0.7889104984  11.379244136 Residuals Base
    ## 45    0.2809407191   5.828150312 Residuals Base
    ## 46   -0.8570234501 -11.723427068 Residuals Base
    ## 47   -0.8214588106 -11.424304426 Residuals Base
    ## 48    0.6588742448  10.129300517 Residuals Base
    ## 49   -0.9453434393 -12.602582286 Residuals Base
    ## 50    1.0910866835  13.294246359 Residuals Base
    ## 51   -0.3677922221  -5.682563830 Residuals Base
    ## 52    0.3962760297   7.260876774 Residuals Base
    ## 53   -0.3194132752  -4.928478844 Residuals Base
    ## 54    0.4722657847   8.202301119 Residuals Base
    ## 55    0.9136220177  12.189830176 Residuals Base
    ## 56    1.5437348411  15.389305365 Residuals Base
    ## 57    0.2947400209   6.016760399 Residuals Base
    ## 58    1.8524088450  16.900465495 Residuals Base
    ## 59    1.1867439373  13.667062976 Residuals Base
    ## 60    0.4234755183   7.656099215 Residuals Base
    ## 61   -1.0093779124 -13.111846047 Residuals Base
    ## 62    0.5631146629   9.122266523 Residuals Base
    ## 63   -0.4331495831  -6.503106175 Residuals Base
    ## 64    0.4218670446   7.632980608 Residuals Base
    ## 65    2.3616769353  19.840520887 Residuals Base
    ## 66   -0.7829006666 -10.825498257 Residuals Base
    ## 67    0.9203414283  12.245697656 Residuals Base
    ## 68    0.1201772702   3.523373036 Residuals Base
    ## 69    0.7474164701  11.074255768 Residuals Base
    ## 70    0.5391422098   8.862352665 Residuals Base
    ## 71    0.2504620530   5.379650434 Residuals Base
    ## 72    1.1432512908  13.497950798 Residuals Base
    ## 73   -2.4703616295 -24.670359569 Residuals Base
    ## 74   -0.0832088875  -0.908984692 Residuals Base
    ## 75    0.3520973466   6.792600429 Residuals Base
    ## 76   -0.3835782275  -5.790289635 Residuals Base
    ## 77   -0.3147726589  -4.837969225 Residuals Base
    ## 78    1.0366851197  12.950425814 Residuals Base
    ## 79    0.0905918584   3.005315404 Residuals Base
    ## 80    0.7147472132  10.882480296 Residuals Base
    ## 81   -0.8676912444 -11.836912899 Residuals Base
    ## 82    1.0804775527  13.233428997 Residuals Base
    ## 83    0.5255823771   8.721083317 Residuals Base
    ## 84    0.3070532816   6.149336064 Residuals Base
    ## 85    1.2263408830  13.861788512 Residuals Base
    ## 86   -0.9203414283 -12.262285296 Residuals Base
    ## 87    1.4366354815  14.991100179 Residuals Base
    ## 88    1.0266666360  12.910814451 Residuals Base
    ## 89   -0.2717709776  -4.186499700 Residuals Base
    ## 90   -0.4412423475  -6.609439376 Residuals Base
    ## 91   -1.1690812635 -15.049236318 Residuals Base
    ## 92   -0.4090380510  -6.064206393 Residuals Base
    ## 93    0.0950239865   3.116249627 Residuals Base
    ## 94    1.8949532799  17.131563429 Residuals Base
    ## 95    0.4987468338   8.482877299 Residuals Base
    ## 96   -0.0551914813  -0.108986282 Residuals Base
    ## 97    0.3380458469   6.683362809 Residuals Base
    ## 98    0.2111804327   4.918298864 Residuals Base
    ## 99   -0.0507722015  -0.007519118 Residuals Base
    ## 100   0.4250850883   7.680718288 Residuals Base
    ## 101   0.7300238818  10.933117041 Residuals Base
    ## 102   0.3709419740   7.055381451 Residuals Base
    ## 103   1.1837744786  13.655757255 Residuals Base
    ## 104   0.1856751326   4.637151101 Residuals Base
    ## 105   0.8893289986  12.098535395 Residuals Base
    ## 106  -0.2021637230  -3.081638119 Residuals Base
    ## 107   1.6842355767  15.910366314 Residuals Base
    ## 108   0.8849683368  12.086740658 Residuals Base
    ## 109  -1.3887588134 -16.978691373 Residuals Base
    ## 110  -0.4154440008  -6.122647126 Residuals Base
    ## 111   3.4376182301  23.801882349 Residuals Base
    ## 112  -0.6479476974  -9.179487733 Residuals Base
    ## 113   0.2519802391   5.387622702 Residuals Base
    ## 114   0.5408441289   8.873405115 Residuals Base
    ## 115  -1.6100159871 -18.828425035 Residuals Base
    ## 116   0.5222075618   8.708079761 Residuals Base
    ## 117   0.9780458593  12.567512904 Residuals Base
    ## 118  -3.1279062330 -28.948886247 Residuals Base
    ## 119  -0.1172144192  -1.595579871 Residuals Base
    ## 120   0.2886002242   5.950834404 Residuals Base
    ## 121  -0.2626240315  -4.062518207 Residuals Base
    ## 122  -0.2096764748  -3.161436669 Residuals Base
    ## 123   0.6884059419  10.543207627 Residuals Base
    ## 124  -1.6431489813 -19.159001391 Residuals Base
    ## 125  -0.4266957603  -6.299263782 Residuals Base
    ## 126  -0.6156197095  -8.825549344 Residuals Base
    ## 127  -1.3259412597 -16.381905802 Residuals Base
    ## 128  -2.1710210996 -22.796794052 Residuals Base
    ## 129  -1.2549220950 -15.823941695 Residuals Base
    ## 130   0.2081729909   4.883442360 Residuals Base
    ## 131   1.6319048579  15.714501031 Residuals Base
    ## 132   0.3209616722   6.402620327 Residuals Base
    ## 133   0.6067541434   9.691218435 Residuals Base
    ## 134  -1.4004287138 -17.120336233 Residuals Base
    ## 135   0.5323500580   8.810955216 Residuals Base
    ## 136   0.7513121999  11.098150740 Residuals Base
    ## 137  -0.3318222607  -5.193759208 Residuals Base
    ## 138   1.3438694382  14.367107433 Residuals Base
    ## 139   1.0570408209  13.039403040 Residuals Base
    ## 140   0.6625339132  10.164110615 Residuals Base
    ## 141  -0.3788325605  -5.734097954 Residuals Base
    ## 142  -0.1454068313  -2.001246909 Residuals Base
    ## 143  -0.5306558627  -7.695376416 Residuals Base
    ## 144  -0.4509920134  -6.696499686 Residuals Base
    ## 145   0.5874152077   9.470468456 Residuals Base
    ## 146   0.1826827540   4.555083621 Residuals Base
    ## 147  -0.7166476269 -10.169138357 Residuals Base
    ## 148   0.4186533637   7.631020002 Residuals Base
    ## 149  -0.4026488429  -5.975532966 Residuals Base
    ## 150   0.0537182726   2.193691552 Residuals Base
    ## 151  -0.8030456378 -11.187629469 Residuals Base
    ## 152  -1.0366851197 -13.515173176 Residuals Base
    ## 153   1.1018200634  13.363085755 Residuals Base
    ## 154  -0.9662478233 -12.749998917 Residuals Base
    ## 155   1.1987278047  13.722505672 Residuals Base
    ## 156   0.6227471332   9.763717463 Residuals Base
    ## 157  -0.5682935164  -8.267945046 Residuals Base
    ## 158   3.1279062330  23.633360916 Residuals Base
    ## 159  -0.6317011757  -8.995564964 Residuals Base
    ## 160   0.7909201136  11.382747493 Residuals Base
    ## 161   0.3101388115   6.198176132 Residuals Base
    ## 162   0.0832088875   2.759464091 Residuals Base
    ## 163   2.0608301310  17.963557916 Residuals Base
    ## 164   0.1320394964   3.714729302 Residuals Base
    ## 165  -0.0213314944   0.719306413 Residuals Base
    ## 166   0.1558215180   4.125772795 Residuals Base
    ## 167  -0.0125040467   0.947377626 Residuals Base
    ## 168  -0.0699306894  -0.453327219 Residuals Base
    ## 169   0.0198601562   1.591198645 Residuals Base
    ## 170   0.5944217766   9.586226506 Residuals Base
    ## 171  -0.6102946102  -8.750991413 Residuals Base
    ## 172   1.3153857813  14.215633421 Residuals Base
    ## 173   0.0699306894   2.482912421 Residuals Base
    ## 174   0.5579508685   9.099192624 Residuals Base
    ## 175   0.5528019092   8.962966002 Residuals Base
    ## 176  -1.1099541620 -14.208921125 Residuals Base
    ## 177   1.1320126694  13.488812218 Residuals Base
    ## 178  -0.3225108391  -4.978448446 Residuals Base
    ## 179  -0.3163187730  -4.857271023 Residuals Base
    ## 180  -0.9875832202 -12.909492238 Residuals Base
    ## 181  -1.7690955269 -20.141158843 Residuals Base
    ## 182   0.8235219017  11.631924229 Residuals Base
    ## 183   0.9972112697  12.672910259 Residuals Base
    ## 184  -0.7493629134 -10.444567346 Residuals Base
    ## 185   0.7630685161  11.185140870 Residuals Base
    ## 186  -0.2824712877  -4.371570541 Residuals Base
    ## 187  -0.4218670446  -6.188934542 Residuals Base
    ## 188  -1.0725998230 -13.741085396 Residuals Base
    ## 189   1.2879310866  14.114650441 Residuals Base
    ## 190  -0.0095618146   0.975729656 Residuals Base
    ## 191   0.8591491821  11.866159375 Residuals Base
    ## 192  -0.7052835382 -10.002082548 Residuals Base
    ## 193  -0.2962766986  -4.562118648 Residuals Base
    ## 194   0.7789097776  11.255589669 Residuals Base
    ## 195  -0.9972112697 -12.954872168 Residuals Base
    ## 196  -0.8915156823 -12.030895385 Residuals Base
    ## 197  -0.6443227022  -9.176021363 Residuals Base
    ## 198   1.3475073079  14.369416741 Residuals Base
    ## 199  -0.6717222036  -9.526411200 Residuals Base
    ## 200   0.2916687481   5.993168238 Residuals Base
    ## 201   0.4106379553   7.483886905 Residuals Base
    ## 202   0.3008909487   6.075948616 Residuals Base
    ## 203   0.5238942236   8.718278974 Residuals Base
    ## 204   2.2377901695  19.015147938 Residuals Base
    ## 205  -1.3153857813 -16.350614755 Residuals Base
    ## 206   0.8827943054  12.051431563 Residuals Base
    ## 207  -0.8719860966 -11.854358300 Residuals Base
    ## 208   0.2993521583   6.057340199 Residuals Base
    ## 209   0.6921394406  10.686587932 Residuals Base
    ## 210   0.2870669824   5.944834566 Residuals Base
    ## 211   1.8775262037  16.937144216 Residuals Base
    ## 212   0.1796920103   4.504272788 Residuals Base
    ## 213  -0.1722221170  -2.493306361 Residuals Base
    ## 214  -1.2581615611 -15.828515757 Residuals Base
    ## 215  -1.2812172440 -16.057181527 Residuals Base
    ## 216  -1.3224063850 -16.369292581 Residuals Base
    ## 217  -0.4347658512  -6.520337475 Residuals Base
    ## 218   0.2126848685   4.948726202 Residuals Base
    ## 219   0.7689863591  11.212483390 Residuals Base
    ## 220   0.3804134964   7.163951258 Residuals Base
    ## 221  -1.0392060439 -13.522180782 Residuals Base
    ## 222  -1.3810827425 -16.846346784 Residuals Base
    ## 223  -1.7416325040 -19.955555971 Residuals Base
    ## 224   0.7166476269  10.889684585 Residuals Base
    ## 225   0.5137963699   8.654105852 Residuals Base
    ## 226  -0.5493774022  -8.017336896 Residuals Base
    ## 227  -1.4043613713 -17.130625224 Residuals Base
    ## 228   0.7261888527  10.919415081 Residuals Base
    ## 229  -0.0773057941  -0.844906584 Residuals Base
    ## 230   0.6443227022   9.993672900 Residuals Base
    ## 231   0.6425133777   9.985165419 Residuals Base
    ## 232   1.2646804092  14.062914782 Residuals Base
    ## 233  -0.9923857457 -12.942502357 Residuals Base
    ## 234   0.3583646767   6.854234107 Residuals Base
    ## 235   0.2732976610   5.721999594 Residuals Base
    ## 236  -0.2656705350  -4.103630818 Residuals Base
    ## 237   1.7154235234  16.087253786 Residuals Base
    ## 238   0.2641469768   5.625615464 Residuals Base
    ## 239   0.8338904433  11.705761869 Residuals Base
    ## 240  -0.7689863591 -10.715157032 Residuals Base
    ## 241  -0.6662024766  -9.460374451 Residuals Base
    ## 242   0.4838094233   8.269298297 Residuals Base
    ## 243  -0.4772052649  -6.933043362 Residuals Base
    ## 244   1.0093779124  12.764015074 Residuals Base
    ## 245   0.8380630296  11.765617768 Residuals Base
    ## 246  -0.0022065408   1.167891711 Residuals Base
    ## 247   0.3915069734   7.245851317 Residuals Base
    ## 248   1.1897238972  13.684289571 Residuals Base
    ## 249  -0.3178656436  -4.895996276 Residuals Base
    ## 250   0.7571772767  11.139777617 Residuals Base
    ## 251  -0.2702449274  -4.184093870 Residuals Base
    ## 252   1.9038871529  17.182972833 Residuals Base
    ## 253  -0.1053730346  -1.324598993 Residuals Base
    ## 254   1.7218654404  16.105985252 Residuals Base
    ## 255  -0.3962760297  -5.923381025 Residuals Base
    ## 256  -1.0417335898 -13.568935044 Residuals Base
    ## 257   0.4821564157   8.264007149 Residuals Base
    ## 258   0.6828236083  10.462397807 Residuals Base
    ## 259   0.2656705350   5.634463755 Residuals Base
    ## 260  -0.1068523659  -1.370075703 Residuals Base
    ## 261  -1.3926277257 -17.071647659 Residuals Base
    ## 262  -0.7204562435 -10.213394466 Residuals Base
    ## 263   0.2978140763   6.049007417 Residuals Base
    ## 264   0.5648392630   9.131771560 Residuals Base
    ## 265   0.1127720629   3.360478590 Residuals Base
    ## 266  -0.5289631892  -7.689573364 Residuals Base
    ## 267  -1.1837744786 -15.153300609 Residuals Base
    ## 268  -0.3024304519  -4.634272068 Residuals Base
    ## 269   0.2428797004   5.311509647 Residuals Base
    ## 270  -0.4461118797  -6.635447589 Residuals Base
    ## 271   0.4058413761   7.447964689 Residuals Base
    ## 272  -1.3118996649 -16.338940167 Residuals Base
    ## 273  -0.1424341505  -1.925143183 Residuals Base
    ## 274  -1.3849105777 -16.897241038 Residuals Base
    ## 275  -2.1868172381 -22.798504242 Residuals Base
    ## 276  -0.1246235340  -1.704375330 Residuals Base
    ## 277   0.7109541057  10.836350065 Residuals Base
    ## 278   0.2247380030   5.160621328 Residuals Base
    ## 279   0.3396037821   6.708317461 Residuals Base
    ## 280  -0.7809036674 -10.793555401 Residuals Base
    ## 281  -2.3384059923 -24.082497334 Residuals Base
    ## 282  -0.2916687481  -4.506957252 Residuals Base
    ## 283  -0.4854637540  -7.040156564 Residuals Base
    ## 284   0.7869040643  11.365222231 Residuals Base
    ## 285  -0.2763529437  -4.263130926 Residuals Base
    ## 286   1.4792088423  15.139586761 Residuals Base
    ## 287  -0.3008909487  -4.609120170 Residuals Base
    ## 288   0.5752224743   9.265547846 Residuals Base
    ## 289  -1.1957157276 -15.190132017 Residuals Base
    ## 290   0.0375199638   1.856566707 Residuals Base
    ## 291   0.8464523063  11.814441686 Residuals Base
    ## 292   0.7377263587  10.964046489 Residuals Base
    ## 293  -0.0743552701  -0.570529383 Residuals Base
    ## 294   1.0596161818  13.065407989 Residuals Base
    ## 295   1.5199596115  15.252757955 Residuals Base
    ## 296  -0.0316323331   0.454397895 Residuals Base
    ## 297   0.5804373583   9.327982252 Residuals Base
    ## 298   1.8284085249  16.672731223 Residuals Base
    ## 299  -0.5087670857  -7.356918415 Residuals Base
    ## 300  -1.2139540843 -15.326556403 Residuals Base
    ## 301   0.5700231867   9.201371850 Residuals Base
    ## 302  -1.5684161798 -18.515323884 Residuals Base
    ## 303   1.2516957449  14.008287415 Residuals Base
    ## 304   0.3225108391   6.425433003 Residuals Base
    ## 305  -0.5891641348  -8.452513374 Residuals Base
    ## 306   1.4284269244  14.966700826 Residuals Base
    ## 307  -0.4755574834  -6.898347211 Residuals Base
    ## 308   0.7650381525  11.203077837 Residuals Base
    ## 309  -0.2428797004  -3.898599633 Residuals Base
    ## 310   0.4788543430   8.250873700 Residuals Base
    ## 311  -2.0139566548 -21.973019125 Residuals Base
    ## 312   0.0404642542   1.915042898 Residuals Base
    ## 313  -0.6534012199  -9.266527095 Residuals Base
    ## 314   1.1376140191  13.490749902 Residuals Base
    ## 315  -0.6370979668  -9.026238714 Residuals Base
    ## 316  -1.1126819033 -14.279587593 Residuals Base
    ## 317   1.9510059497  17.520289905 Residuals Base
    ## 318  -0.6085234233  -8.728424453 Residuals Base
    ## 319  -0.4673378004  -6.801091145 Residuals Base
    ## 320   0.5476675641   8.933841933 Residuals Base
    ## 321  -1.2745606616 -16.031383782 Residuals Base
    ## 322   1.0964375840  13.337024686 Residuals Base
    ## 323   0.1409482835   3.866964776 Residuals Base
    ## 324  -0.7396588182 -10.319779080 Residuals Base
    ## 325  -0.8871465590 -11.962529509 Residuals Base
    ## 326   0.9361841086  12.350444013 Residuals Base
    ## 327   1.6781907900  15.869463696 Residuals Base
    ## 328  -1.5153063709 -18.112929452 Residuals Base
    ## 329   0.8485589438  11.824911530 Residuals Base
    ## 330  -1.9920870977 -21.871532387 Residuals Base
    ## 331   0.9384665588  12.361010892 Residuals Base
    ## 332  -0.0139752017   0.925413983 Residuals Base
    ## 333   0.7033983866  10.753446335 Residuals Base
    ## 334   1.1778666679  13.624645874 Residuals Base
    ## 335  -0.7571772767 -10.659186472 Residuals Base
    ## 336  -0.2337992330  -3.681222210 Residuals Base
    ## 337   0.6846820143  10.474585015 Residuals Base
    ## 338  -0.6263227208  -8.891781440 Residuals Base
    ## 339   0.0228028787   1.674908853 Residuals Base
    ## 340   0.2443950403   5.351538104 Residuals Base
    ## 341  -0.8132411474 -11.279938174 Residuals Base
    ## 342   0.1588002002   4.171246248 Residuals Base
    ## 343  -0.6754134139  -9.583557041 Residuals Base
    ## 344  -0.8485589438 -11.658573441 Residuals Base
    ## 345  -0.3240607803  -4.983076756 Residuals Base
    ## 346   1.5389099117  15.350635623 Residuals Base
    ## 347   0.6534012199  10.097532598 Residuals Base
    ## 348   0.2006625545   4.793934991 Residuals Base
    ## 349  -0.2611016951  -4.060894819 Residuals Base
    ## 350   0.0787813069   2.627967688 Residuals Base
    ## 351  -0.2247380030  -3.555749070 Residuals Base
    ## 352  -0.5786973162  -8.362149371 Residuals Base
    ## 353   0.7809036674  11.271988317 Residuals Base
    ## 354  -0.2292662650  -3.601479452 Residuals Base
    ## 355   0.0861615091   2.828140053 Residuals Base
    ## 356  -0.0950239865  -1.172739206 Residuals Base
    ## 357   1.1808154216  13.652125601 Residuals Base
    ## 358  -1.9711307685 -21.832619743 Residuals Base
    ## 359  -0.3867468049  -5.811902212 Residuals Base
    ## 360   0.8132411474  11.538857192 Residuals Base
    ## 361   0.6352969817   9.893579214 Residuals Base
    ## 362  -0.6209623234  -8.846731083 Residuals Base
    ## 363  -0.5944217766  -8.518384758 Residuals Base
    ## 364   1.3849105777  14.579032005 Residuals Base
    ## 365   0.9339065251  12.339880668 Residuals Base
    ## 366  -0.2307767263  -3.629978534 Residuals Base
    ## 367   0.4042445945   7.438570054 Residuals Base
    ## 368  -1.5485959787 -18.417362733 Residuals Base
    ## 369   0.0551914813   2.226751435 Residuals Base
    ## 370  -1.0857668422 -13.935135154 Residuals Base
    ## 371   0.6515812270  10.074178220 Residuals Base
    ## 372  -0.9639043222 -12.732252793 Residuals Base
    ## 373   0.8091528532  11.525712439 Residuals Base
    ## 374  -1.7906043561 -20.321139666 Residuals Base
    ## 375   1.8442902952  16.708518063 Residuals Base
    ## 376  -0.4739109922  -6.864148409 Residuals Base
    ## 377  -1.1603851778 -14.853410410 Residuals Base
    ## 378  -0.2489444440  -3.917671319 Residuals Base
    ## 379  -1.0341707665 -13.464147640 Residuals Base
    ## 380  -0.3740954102  -5.700945380 Residuals Base
    ## 381  -0.4010541160  -5.967044375 Residuals Base
    ## 382  -0.4186533637  -6.136786056 Residuals Base
    ## 383   0.8676912444  11.936832203 Residuals Base
    ## 384  -1.5634033765 -18.509249634 Residuals Base
    ## 385  -0.8506693538 -11.684302666 Residuals Base
    ## 386  -0.4526211086  -6.706722674 Residuals Base
    ## 387  -0.8698366649 -11.846712022 Residuals Base
    ## 388  -1.2201240828 -15.362127652 Residuals Base
    ## 389  -1.5015399476 -17.925491916 Residuals Base
    ## 390  -0.1558215180  -2.176476132 Residuals Base
    ## 391   0.2565382990   5.511868182 Residuals Base
    ## 392  -0.9003054032 -12.186291914 Residuals Base
    ## 393   0.7929329281  11.388527848 Residuals Base
    ## 394  -1.2981120729 -16.198985780 Residuals Base
    ## 395   0.4461118797   7.936708933 Residuals Base
    ## 396  -1.5199596115 -18.165446586 Residuals Base
    ## 397   1.5785617248  15.502465039 Residuals Base
    ## 398  -0.6389010207  -9.048234217 Residuals Base
    ## 399  -0.0522451804  -0.047441222 Residuals Base
    ## 400  -0.9158572260 -12.256769837 Residuals Base
    ## 401  -0.3209616722  -4.966272875 Residuals Base
    ## 402   1.3965175965  14.683293670 Residuals Base
    ## 403   1.4925180831  15.157565618 Residuals Base
    ## 404   0.7670107612  11.211439964 Residuals Base
    ## 405   1.7483753059  16.283590139 Residuals Base
    ## 406   1.1126819033  13.415974655 Residuals Base
    ## 407   1.0192198782  12.822515507 Residuals Base
    ## 408   0.5769590244   9.269098512 Residuals Base
    ## 409  -1.9129756194 -21.346719631 Residuals Base
    ## 410  -0.4887764111  -7.046981426 Residuals Base
    ## 411   1.6903425386  15.921575321 Residuals Base
    ## 412  -2.5766418614 -24.968556350 Residuals Base
    ## 413  -0.8401548026 -11.608280781 Residuals Base
    ## 414   1.6100159871  15.614826413 Residuals Base
    ## 415   0.0286889416   1.742310265 Residuals Base
    ## 416   1.4407763132  14.993392071 Residuals Base
    ## 417  -1.1632741016 -14.941672108 Residuals Base
    ## 418   0.1528442176   4.088146593 Residuals Base
    ## 419  -0.6552233796  -9.339753802 Residuals Base
    ## 420   1.2812172440  14.099120846 Residuals Base
    ## 421  -1.2712534480 -16.009925874 Residuals Base
    ## 422   1.0778442096  13.189378513 Residuals Base
    ## 423  -1.1348088937 -14.437052370 Residuals Base
    ## 424   0.5562329114   9.051443167 Residuals Base
    ## 425   0.7435320508  11.014439581 Residuals Base
    ## 426  -0.5425476160  -7.896593391 Residuals Base
    ## 427   1.2981120729  14.135600612 Residuals Base
    ## 428  -0.6334980548  -9.014756147 Residuals Base
    ## 429   0.1871719439   4.669691950 Residuals Base
    ## 430   1.6154159092  15.671675488 Residuals Base
    ## 431  -0.6772624726  -9.643897499 Residuals Base
    ## 432   0.9569053642  12.474093353 Residuals Base
    ## 433  -1.0752183198 -13.781755113 Residuals Base
    ## 434  -1.4575919434 -17.552464599 Residuals Base
    ## 435   0.1781972426   4.483399569 Residuals Base
    ## 436  -0.0375199638   0.284946491 Residuals Base
    ## 437   1.2679600808  14.071231540 Residuals Base
    ## 438   0.3646461149   6.938593933 Residuals Base
    ## 439   0.0891148820   2.949432291 Residuals Base
    ## 440  -1.3511630985 -16.654625627 Residuals Base
    ## 441   0.4954178966   8.429859591 Residuals Base
    ## 442  -0.3427221312  -5.412683264 Residuals Base
    ## 443   0.5665655447   9.169987151 Residuals Base
    ## 444  -1.8949532799 -21.278878965 Residuals Base
    ## 445   0.0728802524   2.534976829 Residuals Base
    ## 446   1.1749281205  13.619853791 Residuals Base
    ## 447  -0.3287152956  -5.118885148 Residuals Base
    ## 448  -0.5255823771  -7.671149702 Residuals Base
    ## 449   0.6191794895   9.758782453 Residuals Base
    ## 450   0.6370979668   9.895460956 Residuals Base
    ## 451   0.6120677137   9.719890563 Residuals Base
    ## 452  -1.3366465759 -16.459883700 Residuals Base
    ## 453   0.5510888478   8.952105613 Residuals Base
    ## 454   1.9609690869  17.540741134 Residuals Base
    ## 455   0.5020813071   8.494178437 Residuals Base
    ## 456   1.1957157276  13.702723280 Residuals Base
    ## 457  -0.5222075618  -7.655828619 Residuals Base
    ## 458  -0.4920944406  -7.155344276 Residuals Base
    ## 459  -1.0142866142 -13.179801769 Residuals Base
    ## 460   1.1489251297  13.508806044 Residuals Base
    ## 461   1.4243584932  14.929307393 Residuals Base
    ## 462  -0.0920690324  -1.159255551 Residuals Base
    ## 463  -0.1038939339  -1.300581959 Residuals Base
    ## 464   0.5442526790   8.912989565 Residuals Base
    ## 465  -0.7513121999 -10.458790681 Residuals Base
    ## 466   1.0937582192  13.321918946 Residuals Base
    ## 467   0.2322877144   5.226668280 Residuals Base
    ## 468  -0.2580588329  -4.031072304 Residuals Base
    ## 469   1.7979615660  16.545496875 Residuals Base
    ## 470  -1.2108863438 -15.285733510 Residuals Base
    ## 471   0.7949489602  11.398011253 Residuals Base
    ## 472  -1.4122925138 -17.265307573 Residuals Base
    ## 473   0.1692368717   4.371544542 Residuals Base
    ## 474   1.2913098855  14.118185887 Residuals Base
    ## 475  -0.1439203319  -1.937174637 Residuals Base
    ## 476  -0.8173430796 -11.372056263 Residuals Base
    ## 477  -0.4591495720  -6.748190989 Residuals Base
    ## 478   0.6299063340   9.808983286 Residuals Base
    ## 479  -1.4243584932 -17.342785279 Residuals Base
    ## 480   0.6497633899  10.062071150 Residuals Base
    ## 481  -1.1404281247 -14.458307355 Residuals Base
    ## 482   0.7185506323  10.897661565 Residuals Base
    ## 483   0.9316337759  12.322392402 Residuals Base
    ## 484  -0.2534990061  -3.959766860 Residuals Base
    ## 485   1.1719996838  13.616277015 Residuals Base
    ## 486  -0.0183888611   0.791285377 Residuals Base
    ## 487   1.0069326592  12.723148807 Residuals Base
    ## 488   0.0935464073   3.073592923 Residuals Base
    ## 489  -0.0360479422   0.311781035 Residuals Base
    ## 490  -0.9685966432 -12.764197177 Residuals Base
    ## 491   1.7551985485  16.366653898 Residuals Base
    ## 492  -0.8549015837 -11.701041485 Residuals Base
    ## 493   0.2534990061   5.446513458 Residuals Base
    ## 494  -0.3055116140  -4.685732717 Residuals Base
    ## 495   0.2051674309   4.826352151 Residuals Base
    ## 496   1.2017507969  13.741903102 Residuals Base
    ## 497   0.1513560770   4.085485044 Residuals Base
    ## 498  -0.1364925358  -1.885906955 Residuals Base
    ## 499  -1.2516957449 -15.817315837 Residuals Base
    ## 500   0.5121185037   8.640530545 Residuals Base
    ## 501   0.2962766986   6.017336369 Residuals Base
    ## 502   0.4558829115   8.106899383 Residuals Base
    ## 503  -0.6607029729  -9.423296541 Residuals Base
    ## 504  -0.8464523063 -11.646499739 Residuals Base
    ## 505  -1.2232265734 -15.366709663 Residuals Base
    ## 506  -1.1209152388 -14.330262633 Residuals Base
    ## 507  -2.2377901695 -23.237778249 Residuals Base
    ## 508  -1.1045233111 -14.194870779 Residuals Base
    ## 509   0.3693666400   7.029860594 Residuals Base
    ## 510  -1.2778818749 -16.049850559 Residuals Base
    ## 511   1.2108863438  13.787278519 Residuals Base
    ## 512   1.1045233111  13.391253448 Residuals Base
    ## 513  -0.3489688757  -5.529288060 Residuals Base
    ## 514  -1.6965132006 -19.705947968 Residuals Base
    ## 515  -0.5717545641  -8.280918530 Residuals Base
    ## 516   1.2452818388  13.992533785 Residuals Base
    ## 517  -0.9899816288 -12.933298707 Residuals Base
    ## 518   1.1209152388  13.448127239 Residuals Base
    ## 519   0.2855344152   5.876627538 Residuals Base
    ## 520   1.6546047723  15.812346022 Residuals Base
    ## 521  -1.5584295536 -18.445989014 Residuals Base
    ## 522   0.9025137181  12.134424426 Residuals Base
    ## 523   1.2484823718  14.002404733 Residuals Base
    ## 524  -1.4704795330 -17.616882190 Residuals Base
    ## 525  -1.7979615660 -20.433141048 Residuals Base
    ## 526  -1.5888724072 -18.620788138 Residuals Base
    ## 527   0.5717545641   9.214413514 Residuals Base
    ## 528  -1.6722067086 -19.366334800 Residuals Base
    ## 529  -0.1528442176  -2.166463442 Residuals Base
    ## 530  -0.9361841086 -12.502574072 Residuals Base
    ## 531  -0.0301606047   0.495060747 Residuals Base
    ## 532  -1.0069326592 -13.097500757 Residuals Base
    ## 533  -0.6735666616  -9.570503142 Residuals Base
    ## 534  -0.6067541434  -8.705798275 Residuals Base
    ## 535   1.4836160909  15.152994969 Residuals Base
    ## 536   0.3662187154   6.972501028 Residuals Base
    ## 537  -0.1617802921  -2.231517967 Residuals Base
    ## 538  -0.3851620328  -5.795030646 Residuals Base
    ## 539  -0.0448813556   0.137230516 Residuals Base
    ## 540   0.1886691747   4.678885583 Residuals Base
    ## 541  -0.3725182290  -5.700299454 Residuals Base
    ## 542   0.5004133750   8.487221195 Residuals Base
    ## 543  -0.9780458593 -12.837526973 Residuals Base
    ## 544   1.1292252684  13.488776825 Residuals Base
    ## 545   1.5534939885  15.415855843 Residuals Base
    ## 546   0.6173986216   9.740241153 Residuals Base
    ## 547  -1.2614142846 -15.870916159 Residuals Base
    ## 548  -0.3442825544  -5.419803875 Residuals Base
    ## 549  -1.2263408830 -15.430503366 Residuals Base
    ## 550   2.5379549161  20.746513479 Residuals Base
    ## 551   0.5734876570   9.248517605 Residuals Base
    ## 552   0.0448813556   2.023087857 Residuals Base
    ## 553  -0.8338904433 -11.551694444 Residuals Base
    ## 554   1.6604150432  15.813917355 Residuals Base
    ## 555  -0.2081729909  -3.146962380 Residuals Base
    ## 556  -0.6407061541  -9.092247491 Residuals Base
    ## 557  -1.7283796147 -19.844911816 Residuals Base
    ## 558   1.5246459980  15.255063953 Residuals Base
    ## 559   0.1009364109   3.205302087 Residuals Base
    ## 560   0.1068523659   3.255222708 Residuals Base
    ## 561   1.1181623699  13.441346903 Residuals Base
    ## 562   0.0994579821   3.180546169 Residuals Base
    ## 563   0.1394627277   3.769717210 Residuals Base
    ## 564   0.3287152956   6.527968469 Residuals Base
    ## 565   0.2202143447   5.059304499 Residuals Base
    ## 566   0.4428643570   7.925801154 Residuals Base
    ## 567  -0.5121185037  -7.371683836 Residuals Base
    ## 568  -0.2947400209  -4.552915108 Residuals Base
    ## 569   0.9407539085  12.404697883 Residuals Base
    ## 570  -0.4444875324  -6.632334316 Residuals Base
    ## 571  -0.1826827540  -2.656818264 Residuals Base
    ## 572   0.0110329187   1.501174600 Residuals Base
    ## 573   2.1868172381  18.885475133 Residuals Base
    ## 574   0.7319454266  10.939506189 Residuals Base
    ## 575   0.7969682285  11.398439369 Residuals Base
    ## 576   0.1976615700   4.745811141 Residuals Base
    ## 577  -0.6977578572  -9.859056215 Residuals Base
    ## 578  -1.5293661104 -18.242020173 Residuals Base
    ## 579   1.3224063850  14.235445122 Residuals Base
    ## 580   1.2357559435  13.934141106 Residuals Base
    ## 581  -0.4954178966  -7.228094139 Residuals Base
    ## 582   0.6049867608   9.668747012 Residuals Base
    ## 583  -1.3965175965 -17.109856280 Residuals Base
    ## 584  -0.7338696779 -10.264803458 Residuals Base
    ## 585   0.6245339289   9.768738957 Residuals Base
    ## 586   0.6570477175  10.112888623 Residuals Base
    ## 587  -1.6208633506 -18.856382305 Residuals Base
    ## 588   1.0831184097  13.239182665 Residuals Base
    ## 589  -0.4788543430  -6.949582779 Residuals Base
    ## 590   0.0507722015   2.128030337 Residuals Base
    ## 591  -0.5961779745  -8.538852845 Residuals Base
    ## 592   0.9522653197  12.449648911 Residuals Base
    ## 593  -0.2066699775  -3.141692932 Residuals Base
    ## 594  -1.0804775527 -13.854113406 Residuals Base
    ## 595   1.6263593197  15.699182618 Residuals Base
    ## 596  -1.4618608590 -17.593375373 Residuals Base
    ## 597  -0.2443950403  -3.907009275 Residuals Base
    ## 598   1.3118996649  14.213441488 Residuals Base
    ## 599   0.8937066372  12.101615718 Residuals Base
    ## 600  -0.7357966503 -10.274118010 Residuals Base
    ## 601  -0.0610855466  -0.258987006 Residuals Base
    ## 602  -0.3302683796  -5.178910655 Residuals Base
    ## 603  -0.7869040643 -10.934731473 Residuals Base
    ## 604   0.9709508189  12.539467518 Residuals Base
    ## 605   0.4331495831   7.844520946 Residuals Base
    ## 606   0.3946853480   7.259150084 Residuals Base
    ## 607  -0.8634123382 -11.760077398 Residuals Base
    ## 608  -0.3396037821  -5.367717651 Residuals Base
    ## 609   0.8915156823  12.100433500 Residuals Base
    ## 610   1.3585293543  14.480898593 Residuals Base
    ## 611   1.3366465759  14.334181698 Residuals Base
    ## 612   0.8030456378  11.495575907 Residuals Base
    ## 613  -1.0596161818 -13.697820902 Residuals Base
    ## 614   0.9662478233  12.525268672 Residuals Base
    ## 615  -0.0566648099  -0.153682514 Residuals Base
    ## 616  -0.7435320508 -10.379221395 Residuals Base
    ## 617  -1.2646804092 -15.887227099 Residuals Base
    ## 618   1.1546361986  13.538381077 Residuals Base
    ## 619   0.0876381000   2.866066628 Residuals Base
    ## 620  -0.8443494187 -11.632849040 Residuals Base
    ## 621  -0.9828033651 -12.862094841 Residuals Base
    ## 622   0.5374418509   8.860299453 Residuals Base
    ## 623  -0.0891148820  -1.025479310 Residuals Base
    ## 624   0.9225904827  12.271181561 Residuals Base
    ## 625   0.3240607803   6.462709670 Residuals Base
    ## 626  -1.1264466135 -14.374888172 Residuals Base
    ## 627   0.0051486137   1.359674236 Residuals Base
    ## 628   0.4887764111   8.383744272 Residuals Base
    ## 629  -1.1181623699 -14.311454353 Residuals Base
    ## 630   0.5493774022   8.948094188 Residuals Base
    ## 631   0.1038939339   3.225189236 Residuals Base
    ## 632   0.0846851060   2.803543992 Residuals Base
    ## 633  -0.0272173407   0.571707931 Residuals Base
    ## 634   0.0316323331   1.796261673 Residuals Base
    ## 635  -0.4202596616  -6.188843830 Residuals Base
    ## 636  -0.5459593257  -7.939072692 Residuals Base
    ## 637   0.0684561376   2.482630629 Residuals Base
    ## 638   0.1454068313   4.032944563 Residuals Base
    ## 639  -0.5979360130  -8.566550045 Residuals Base
    ## 640  -1.2845669275 -16.066297369 Residuals Base
    ## 641   1.5888724072  15.538257253 Residuals Base
    ## 642  -0.7454728545 -10.396603044 Residuals Base
    ## 643  -1.7090520170 -19.772507055 Residuals Base
    ## 644  -0.0846851060  -0.910650445 Residuals Base
    ## 645  -1.8606513573 -21.050227487 Residuals Base
    ## 646   0.0625593865   2.351207519 Residuals Base
    ## 647   0.2066699775   4.839789443 Residuals Base
    ## 648   0.1991618380   4.778732953 Residuals Base
    ## 649  -0.6515812270  -9.226994868 Residuals Base
    ## 650  -0.5510888478  -8.025305774 Residuals Base
    ## 651  -0.1781972426  -2.582217097 Residuals Base
    ## 652  -0.4380018029  -6.546313318 Residuals Base
    ## 653  -1.0241780726 -13.379522166 Residuals Base
    ## 654   0.7493629134  11.081076918 Residuals Base
    ## 655   0.9248442136  12.285390315 Residuals Base
    ## 656  -0.5408441289  -7.857207217 Residuals Base
    ## 657  -0.0228028787   0.718556981 Residuals Base
    ## 658  -0.6049867608  -8.676492564 Residuals Base
    ## 659   0.9293658287  12.321668574 Residuals Base
    ## 660  -0.3599337015  -5.633702118 Residuals Base
    ## 661   2.0860749877  18.043238118 Residuals Base
    ## 662  -1.2357559435 -15.555274042 Residuals Base
    ## 663  -0.0965017732  -1.185105895 Residuals Base
    ## 664   0.4542514060   8.051136486 Residuals Base
    ## 665  -1.2017507969 -15.243638102 Residuals Base
    ## 666  -1.0647881010 -13.731743693 Residuals Base
    ## 667   1.4970137844  15.194396152 Residuals Base
    ## 668  -2.0860749877 -22.547677243 Residuals Base
    ## 669  -0.6958826120  -9.833933341 Residuals Base
    ## 670   0.5891641348   9.479386412 Residuals Base
    ## 671  -0.2732976610  -4.234401847 Residuals Base
    ## 672   0.1231411766   3.570157073 Residuals Base
    ## 673   0.7204562435  10.898618713 Residuals Base
    ## 674   0.3489688757   6.767060354 Residuals Base
    ## 675   2.8697487123  22.978175841 Residuals Base
    ## 676  -0.5804373583  -8.363806757 Residuals Base
    ## 677  -0.4315344458  -6.470656791 Residuals Base
    ## 678  -0.4428643570  -6.614995255 Residuals Base
    ## 679   2.0368341317  17.918313710 Residuals Base
    ## 680  -2.2031786480 -22.967455256 Residuals Base
    ## 681   1.4661565825  15.075573541 Residuals Base
    ## 682  -0.9180970195 -12.259658588 Residuals Base
    ## 683   0.3271630041   6.512586402 Residuals Base
    ## 684  -3.4376182301 -40.340209276 Residuals Base
    ## 685  -1.7218654404 -19.826997897 Residuals Base
    ## 686   0.3756735225   7.073446522 Residuals Base
    ## 687   0.8255885039  11.636007102 Residuals Base
    ## 688   0.1543326968   4.111301054 Residuals Base
    ## 689   0.0434088954   1.968413577 Residuals Base
    ## 690   1.7690955269  16.484112107 Residuals Base
    ## 691  -2.3163364415 -23.994172928 Residuals Base
    ## 692   0.5054213724   8.543218476 Residuals Base
    ## 693  -0.1976615700  -2.999668460 Residuals Base
    ## 694  -1.7551985485 -20.085519384 Residuals Base
    ## 695   0.6032212660   9.655908416 Residuals Base
    ## 696  -0.8937066372 -12.057960780 Residuals Base
    ## 697   0.3163187730   6.322873958 Residuals Base
    ## 698   0.4673378004   8.155803650 Residuals Base
    ## 699   0.7769189796  11.249750794 Residuals Base
    ## 700  -0.1961617467  -2.987621173 Residuals Base
    ## 701   0.3899192700   7.244167472 Residuals Base
    ## 702   0.6085234233   9.699861434 Residuals Base
    ## 703   0.5786973162   9.269511599 Residuals Base
    ## 704  -0.2398506892  -3.775249529 Residuals Base
    ## 705  -1.4661565825 -17.595275291 Residuals Base
    ## 706   0.7591380946  11.146604748 Residuals Base
    ## 707   1.0417335898  12.979339508 Residuals Base
    ## 708   0.4396214981   7.860191661 Residuals Base
    ## 709  -1.5437348411 -18.321554994 Residuals Base
    ## 710   0.2595799635   5.521020777 Residuals Base
    ## 711   0.2413649180   5.308792044 Residuals Base
    ## 712  -0.4656976637  -6.787715886 Residuals Base
    ## 713   0.0773057941   2.608564627 Residuals Base
    ## 714   0.5425476160   8.901316870 Residuals Base
    ## 715   0.3930956643   7.249870952 Residuals Base
    ## 716  -0.1856751326  -2.876099035 Residuals Base
    ## 717  -0.0640333624  -0.323729668 Residuals Base
    ## 718  -0.3349324322  -5.283400037 Residuals Base
    ## 719   1.5993548248  15.587805692 Residuals Base
    ## 720   1.9711307685  17.563859750 Residuals Base
    ## 721   0.1647618214   4.295920973 Residuals Base
    ## 722  -0.2504620530  -3.933703285 Residuals Base
    ## 723  -0.7969682285 -11.045071196 Residuals Base
    ## 724  -1.1867439373 -15.153780711 Residuals Base
    ## 725  -0.7749312560 -10.756650514 Residuals Base
    ## 726   0.9158572260  12.221484748 Residuals Base
    ## 727  -0.9615661028 -12.727730987 Residuals Base
    ## 728   0.1053730346   3.251540599 Residuals Base
    ## 729  -0.3915069734  -5.864361837 Residuals Base
    ## 730  -0.1573106846  -2.184195013 Residuals Base
    ## 731  -0.3583646767  -5.590319678 Residuals Base
    ## 732   2.2031786480  18.903083270 Residuals Base
    ## 733  -0.9522653197 -12.651660854 Residuals Base
    ## 734   1.1460835983  13.498957227 Residuals Base
    ## 735  -0.4138409247  -6.107256392 Residuals Base
    ## 736  -0.1275890737  -1.732582232 Residuals Base
    ## 737  -0.9569053642 -12.698884919 Residuals Base
    ## 738  -0.1127720629  -1.478723134 Residuals Base
    ## 739  -0.8297323252 -11.522537923 Residuals Base
    ## 740   1.0519110197  13.018254554 Residuals Base
    ## 741  -1.7349679688 -19.873585178 Residuals Base
    ## 742   1.0468087512  12.999287124 Residuals Base
    ## 743  -2.6196185544 -25.129376490 Residuals Base
    ## 744   0.0714053933   2.509904313 Residuals Base
    ## 745  -0.8422502582 -11.610310080 Residuals Base
    ## 746  -0.6299063340  -8.972974660 Residuals Base
    ## 747  -1.4449419977 -17.534274025 Residuals Base
    ## 748  -1.5836960207 -18.597676268 Residuals Base
    ## 749   0.3349324322   6.621269437 Residuals Base
    ## 750  -0.1752088979  -2.528141061 Residuals Base
    ## 751  -0.4283075401  -6.304804894 Residuals Base
    ## 752  -0.1871719439  -2.878144350 Residuals Base
    ## 753   1.5293661104  15.258561899 Residuals Base
    ## 754  -0.7769189796 -10.773788319 Residuals Base
    ## 755   0.0345759986   1.833831612 Residuals Base
    ## 756  -0.2978140763  -4.588674920 Residuals Base
    ## 757  -1.0519110197 -13.679007757 Residuals Base
    ## 758   0.8762970937  11.995859633 Residuals Base
    ## 759  -0.9851904790 -12.877463132 Residuals Base
    ## 760   0.3318222607   6.567308058 Residuals Base
    ## 761   0.3085956793   6.180010807 Residuals Base
    ## 762  -1.3548370370 -16.697275864 Residuals Base
    ## 763  -0.2671947102  -4.146101731 Residuals Base
    ## 764  -0.8255885039 -11.478318916 Residuals Base
    ## 765  -0.1394627277  -1.908306028 Residuals Base
    ## 766  -0.6281135191  -8.899131765 Residuals Base
    ## 767  -0.2322877144  -3.662620678 Residuals Base
    ## 768   2.1557487871  18.549726577 Residuals Base
    ## 769   0.2763529437   5.776306079 Residuals Base
    ## 770  -1.3659700731 -16.777926060 Residuals Base
    ## 771   1.8129749776  16.612627157 Residuals Base
    ## 772  -2.2753102675 -23.327087959 Residuals Base
    ## 773  -2.7893319350 -26.777580618 Residuals Base
    ## 774  -0.9271026518 -12.310279289 Residuals Base
    ## 775  -1.2452818388 -15.633213909 Residuals Base
    ## 776   0.2748249817   5.743181597 Residuals Base
    ## 777   0.4380018029   7.855084910 Residuals Base
    ## 778   0.3442825544   6.737929796 Residuals Base
    ## 779   0.8719860966  11.957105896 Residuals Base
    ## 780  -0.2277563265  -3.574533894 Residuals Base
    ## 781   0.9271026518  12.298217009 Residuals Base
    ## 782  -0.5545165943  -8.057047618 Residuals Base
    ## 783   0.9047264430  12.140032545 Residuals Base
    ## 784  -0.4970816766  -7.234606862 Residuals Base
    ## 785  -0.3552292675  -5.587543543 Residuals Base
    ## 786  -0.2519802391  -3.955713536 Residuals Base
    ## 787   1.6722067086  15.847105173 Residuals Base
    ## 788   1.5584295536  15.462519651 Residuals Base
    ## 789   1.2712534480  14.075345487 Residuals Base
    ## 790  -0.1647618214  -2.382680224 Residuals Base
    ## 791  -2.6680580303 -25.595273804 Residuals Base
    ## 792   0.1632708753   4.291955171 Residuals Base
    ## 793   0.1662531338   4.361804193 Residuals Base
    ## 794  -1.8362915151 -20.909065688 Residuals Base
    ## 795   0.1931634198   4.710745579 Residuals Base
    ## 796   0.2611016951   5.601634271 Residuals Base
    ## 797   1.0647881010  13.079833928 Residuals Base
    ## 798   0.9499529694  12.443022853 Residuals Base
    ## 799   0.7396588182  10.969855511 Residuals Base
    ## 800   0.4526211086   8.046069024 Residuals Base
    ## 801   0.6996355593  10.717633540 Residuals Base
    ## 802   1.8861681393  16.975978952 Residuals Base
    ## 803  -0.1767028730  -2.550450930 Residuals Base
    ## 804  -1.1661727667 -14.997432313 Residuals Base
    ## 805  -1.7027491454 -19.757160001 Residuals Base
    ## 806  -0.2459109416  -3.911576699 Residuals Base
    ## 807  -0.2111804327  -3.264742839 Residuals Base
    ## 808  -1.1432512908 -14.460450265 Residuals Base
    ## 809   0.5037506373   8.540136931 Residuals Base
    ## 810   0.3978677147   7.277193800 Residuals Base
    ## 811   0.0743552701   2.547162280 Residuals Base
    ## 812  -1.2389187562 -15.577025080 Residuals Base
    ## 813  -0.3756735225  -5.711846032 Residuals Base
    ## 814   0.4854637540   8.313980522 Residuals Base
    ## 815  -0.5752224743  -8.316796261 Residuals Base
    ## 816   2.4703616295  20.444930635 Residuals Base
    ## 817   0.0478265711   2.047551465 Residuals Base
    ## 818   1.3772750370  14.566629213 Residuals Base
    ## 819   0.1901668286   4.680051330 Residuals Base
    ## 820   0.4509920134   8.025257944 Residuals Base
    ## 821  -0.0066196653   0.980372610 Residuals Base
    ## 822  -0.1083319310  -1.382722662 Residuals Base
    ## 823  -0.5104420780  -7.366726552 Residuals Base
    ## 824  -2.0486846848 -22.189491580 Residuals Base
    ## 825  -0.9430461909 -12.584748429 Residuals Base
    ## 826   1.4880523469  15.155106240 Residuals Base
    ## 827  -0.5340457827  -7.769617727 Residuals Base
    ## 828  -1.9222249015 -21.388052459 Residuals Base
    ## 829  -0.0463539131   0.112288227 Residuals Base
    ## 830  -1.4970137844 -17.884600048 Residuals Base
    ## 831   0.3994604084   7.285022257 Residuals Base
    ## 832  -1.0673847719 -13.736048268 Residuals Base
    ## 833   1.2294671324  13.863356896 Residuals Base
    ## 834  -0.6014576494  -8.644474318 Residuals Base
    ## 835  -1.0316629343 -13.459426631 Residuals Base
    ## 836  -0.1009364109  -1.252238682 Residuals Base
    ## 837  -0.8071137708 -11.214734338 Residuals Base
    ## 838  -0.2383370101  -3.775227883 Residuals Base
    ## 839   1.5106857113  15.233511064 Residuals Base
    ## 840   0.0566648099   2.288205820 Residuals Base
    ## 841  -0.6570477175  -9.348116655 Residuals Base
    ## 842   0.1261061652   3.597555985 Residuals Base
    ## 843   0.0139752017   1.520378420 Residuals Base
    ## 844  -0.0051486137   0.986436594 Residuals Base
    ## 845   0.1468936521   4.037203871 Residuals Base
    ## 846  -0.1468936521  -2.079816937 Residuals Base
    ## 847   0.4347658512   7.848139339 Residuals Base
    ## 848   2.3163364415  19.675546702 Residuals Base
    ## 849  -0.0434088954   0.145019821 Residuals Base
    ## 850   0.9453434393  12.428205935 Residuals Base
    ## 851  -0.1350078929  -1.834001994 Residuals Base
    ## 852  -0.3772525709  -5.727251691 Residuals Base
    ## 853  -1.0964375840 -14.044332919 Residuals Base
    ## 854  -0.0478265711   0.100129921 Residuals Base
    ## 855  -1.6662819154 -19.304216387 Residuals Base
    ## 856   0.0022065408   1.276759505 Residuals Base
    ## 857   0.1946623645   4.722510642 Residuals Base
    ## 858   0.2580588329   5.518861380 Residuals Base
    ## 859  -1.0937582192 -14.021128216 Residuals Base
    ## 860  -0.2036653472  -3.100873939 Residuals Base
    ## 861   2.1409633303  18.400620825 Residuals Base
    ## 862  -0.0389920668   0.275645336 Residuals Base
    ## 863  -1.4083158692 -17.252572388 Residuals Base
    ## 864   1.0725998230  13.119063259 Residuals Base
    ## 865  -0.3946853480  -5.921774046 Residuals Base
    ## 866   1.3511630985  14.412948333 Residuals Base
    ## 867  -1.2484823718 -15.709336504 Residuals Base
    ## 868   0.9430461909  12.418922729 Residuals Base
    ## 869   0.7242753395  10.911269754 Residuals Base
    ## 870  -0.2641469768  -4.089681881 Residuals Base
    ## 871  -0.5700231867  -8.277008838 Residuals Base
    ## 872  -0.1662531338  -2.385321591 Residuals Base
    ## 873   0.3788325605   7.090027172 Residuals Base
    ## 874  -0.0169176058   0.794938136 Residuals Base
    ## 875   0.0817328504   2.698157220 Residuals Base
    ## 876   1.3926277257  14.661093922 Residuals Base
    ## 877   0.4493641142   8.018392821 Residuals Base
    ## 878   0.6102946102   9.706003666 Residuals Base
    ## 879  -0.1588002002  -2.197450473 Residuals Base
    ## 880   2.0732874076  17.980954244 Residuals Base
    ## 881  -1.5246459980 -18.208638942 Residuals Base
    ## 882  -0.4722657847  -6.844463010 Residuals Base
    ## 883  -0.7474164701 -10.421094086 Residuals Base
    ## 884   1.7090520170  15.980833494 Residuals Base
    ## 885   0.7071711997  10.799953206 Residuals Base
    ## 886  -0.2413649180  -3.782422180 Residuals Base
    ## 887  -1.1517759683 -14.591977449 Residuals Base
    ## 888   0.8010165484  11.489817200 Residuals Base
    ## 889  -1.9609690869 -21.739520715 Residuals Base
    ## 890  -0.8981014700 -12.166711610 Residuals Base
    ## 891   0.1290722628   3.609019575 Residuals Base
    ## 892   0.7281050287  10.923486878 Residuals Base
    ## 893  -0.4624211394  -6.776859095 Residuals Base
    ## 894   0.1841787371   4.628702577 Residuals Base
    ## 895   1.3810827425  14.576462967 Residuals Base
    ## 896   0.0758304496   2.581053235 Residuals Base
    ## 897   0.8152903987  11.541264384 Residuals Base
    ## 898  -0.7849007930 -10.931073251 Residuals Base
    ## 899  -0.5648392630  -8.259267667 Residuals Base
    ## 900   1.5485959787  15.393768281 Residuals Base
    ## 901  -2.1127238216 -22.638943867 Residuals Base
    ## 902  -0.9407539085 -12.576308932 Residuals Base
    ## 903   0.4624211394   8.142632323 Residuals Base
    ## 904  -1.5106857113 -17.959044097 Residuals Base
    ## 905  -1.8054174044 -20.451559041 Residuals Base
    ## 906  -2.1557487871 -22.763884533 Residuals Base
    ## 907   0.4575156315   8.116174191 Residuals Base
    ## 908   1.4618608590  15.066629551 Residuals Base
    ## 909   1.2389187562  13.939171327 Residuals Base
    ## 910  -1.2326054444 -15.452610679 Residuals Base
    ## 911  -0.1692368717  -2.426733908 Residuals Base
    ## 912  -0.3536628734  -5.569360995 Residuals Base
    ## 913  -0.8527835594 -11.696149256 Residuals Base
    ## 914   0.3458438165   6.745993442 Residuals Base
    ## 915   0.0331041300   1.824077735 Residuals Base
    ## 916  -0.1483807977  -2.114387774 Residuals Base
    ## 917   0.0389920668   1.893768122 Residuals Base
    ## 918  -1.8284085249 -20.650686291 Residuals Base
    ## 919  -1.3585293543 -16.748088559 Residuals Base
    ## 920  -0.3567965336  -5.590100192 Residuals Base
    ## 921   0.5205223843   8.687580094 Residuals Base
    ## 922  -2.8697487123 -27.071426755 Residuals Base
    ## 923  -0.7552193656 -10.639380064 Residuals Base
    ## 924  -0.3662187154  -5.681732997 Residuals Base
    ## 925   0.5104420780   8.599728936 Residuals Base
    ## 926  -0.4937554869  -7.220011961 Residuals Base
    ## 927   0.5188386837   8.686196069 Residuals Base
    ## 928   1.1348088937  13.489636216 Residuals Base
    ## 929   0.9069436065  12.159843782 Residuals Base
    ## 930  -0.9545827729 -12.656339785 Residuals Base
    ## 931   1.2947034910  14.122699299 Residuals Base
    ## 932   0.9899816288  12.641069869 Residuals Base
    ## 933   1.2549220950  14.009121326 Residuals Base
    ## 934   1.4491329081  15.019250214 Residuals Base
    ## 935  -1.5785617248 -18.554254183 Residuals Base
    ## 936   0.6281135191   9.806649121 Residuals Base
    ## 937   1.4203135025  14.856172465 Residuals Base
    ## 938   1.5015399476  15.203406572 Residuals Base
    ## 939   0.2794108083   5.797509472 Residuals Base
    ## 940   1.1072346544  13.391634241 Residuals Base
    ## 941  -0.1024150604  -1.258130182 Residuals Base
    ## 942   1.4004287138  14.713350110 Residuals Base
    ## 943   0.3256115005   6.492028101 Residuals Base
    ## 944   0.6479476974  10.059130124 Residuals Base
    ## 945  -0.4477374050  -6.689779685 Residuals Base
    ## 946   0.0979797706   3.162686085 Residuals Base
    ## 947   0.4689791952   8.172975138 Residuals Base
    ## 948  -0.2051674309  -3.115525227 Residuals Base
    ## 949   1.5634033765  15.477128812 Residuals Base
    ## 950  -0.1946623645  -2.986322704 Residuals Base
    ## 951   0.5171564526   8.673115890 Residuals Base
    ## 952  -0.6352969817  -9.015118680 Residuals Base
    ## 953   0.5961779745   9.598785756 Residuals Base
    ## 954  -1.0778442096 -13.796541366 Residuals Base
    ## 955  -0.2870669824  -4.424729237 Residuals Base
    ## 956  -0.2232296105  -3.508312546 Residuals Base
    ## 957   0.0272173407   1.723350193 Residuals Base
    ## 958   0.8111953055  11.535826709 Residuals Base
    ## 959  -1.6488498286 -19.181423242 Residuals Base
    ## 960   2.0252629033  17.858681563 Residuals Base
    ## 961   1.9129756194  17.206762112 Residuals Base
    ## 962  -0.5996959015  -8.637266058 Residuals Base
    ## 963   0.0360479422   1.834757357 Residuals Base
    ## 964   0.3599337015   6.900229780 Residuals Base
    ## 965   0.8276586380  11.639760794 Residuals Base
    ## 966   0.3039706723   6.105049873 Residuals Base
    ## 967  -1.3330611506 -16.417129463 Residuals Base
    ## 968  -0.2368238770  -3.712889736 Residuals Base
    ## 969  -0.9709508189 -12.783737880 Residuals Base
    ## 970   0.0669817347   2.467778864 Residuals Base
    ## 971   2.1127238216  18.320628636 Residuals Base
    ## 972   1.7906043561  16.534033259 Residuals Base
    ## 973   1.4748301398  15.096465441 Residuals Base
    ## 974   0.0125040467   1.503181790 Residuals Base
    ## 975   1.5836960207  15.510445422 Residuals Base
    ## 976   0.8214588106  11.554730397 Residuals Base
    ## 977  -0.1335235476  -1.811073612 Residuals Base
    ## 978   1.3330611506  14.319205004 Residuals Base
    ## 979  -0.8849683368 -11.915000046 Residuals Base
    ## 980  -1.4203135025 -17.315070995 Residuals Base
    ## 981   1.3402492670  14.348030978 Residuals Base
    ## 982  -0.3646461149  -5.666880914 Residuals Base
    ## 983  -0.5596704740  -8.146533134 Residuals Base
    ## 984  -0.3364887318  -5.351373039 Residuals Base
    ## 985   1.9316416134  17.421174349 Residuals Base
    ## 986   0.2021637230   4.801426672 Residuals Base
    ## 987  -0.1216590898  -1.623085516 Residuals Base
    ## 988   0.1498682715   4.080685181 Residuals Base
    ## 989  -1.1897238972 -15.171657566 Residuals Base
    ## 990  -0.9499529694 -12.610637868 Residuals Base
    ## 991  -1.2170332922 -15.357543932 Residuals Base
    ## 992   0.1216590898   3.533276739 Residuals Base
    ## 993  -1.5060970823 -17.929247041 Residuals Base
    ## 994  -0.4838094233  -7.008350808 Residuals Base
    ## 995  -1.2679600808 -15.958253588 Residuals Base
    ## 996  -0.6698800280  -9.522318148 Residuals Base
    ## 997   0.3024304519   6.094776590 Residuals Base
    ## 998  -0.0905918584  -1.153056981 Residuals Base
    ## 999  -0.1098117334  -1.386224626 Residuals Base
    ## 1000 -0.7109541057 -10.091163684 Residuals Base
    ## 1001  1.0020601270  12.686769462 Residuals Base
    ## 1002 -0.3615036128  -5.636896738 Residuals Base
    ## 1003 -0.3039706723  -4.654519978 Residuals Base
    ## 1004 -0.0154463870   0.847420519 Residuals Base
    ## 1005 -0.2901341447  -4.450032938 Residuals Base
    ## 1006 -1.9412327949 -21.707219805 Residuals Base
    ## 1007  0.1424341505   3.877034569 Residuals Base
    ## 1008 -0.4987468338  -7.238431295 Residuals Base
    ## 1009  0.0066196653   1.386978973 Residuals Base
    ## 1010 -0.8959018906 -12.117413497 Residuals Base
    ## 1011 -0.4042445945  -5.990731776 Residuals Base
    ## 1012  0.4074391931   7.471061661 Residuals Base
    ## 1013 -0.0876381000  -0.914508898 Residuals Base
    ## 1014 -0.2474274082  -3.916271993 Residuals Base
    ## 1015 -0.2932040388  -4.516371830 Residuals Base
    ## 1016 -0.2156951883  -3.378982013 Residuals Base
    ## 1017 -0.0758304496  -0.645532230 Residuals Base
    ## 1018 -0.0935464073  -1.171347056 Residuals Base
    ## 1019 -1.1987278047 -15.212705905 Residuals Base
    ## 1020  1.4122925138  14.759595446 Residuals Base
    ## 1021 -0.0861615091  -0.913859541 Residuals Base
    ## 1022  0.7015157313  10.720407708 Residuals Base
    ## 1023 -1.0167501531 -13.194716530 Residuals Base
    ## 1024 -0.5037506373  -7.282756235 Residuals Base
    ## 1025  1.1690812635  13.602656428 Residuals Base
    ## 1026  0.0154463870   1.527752700 Residuals Base
    ## 1027  0.7090613843  10.814972147 Residuals Base
    ## 1028 -0.1811871796  -2.650241466 Residuals Base
    ## 1029 -1.4880523469 -17.843147509 Residuals Base
    ## 1030 -0.2217217256  -3.472510676 Residuals Base
    ## 1031 -0.4106379553  -6.101563575 Residuals Base
    ## 1032  0.6461341385  10.006152710 Residuals Base
    ## 1033  0.9756753888  12.553112807 Residuals Base
    ## 1034 -1.1808154216 -15.140728350 Residuals Base
    ## 1035 -0.6940098108  -9.764004256 Residuals Base
    ## 1036 -0.6625339132  -9.456049134 Residuals Base
    ## 1037  0.1172144192   3.490648004 Residuals Base
    ## 1038 -0.4074391931  -6.043002844 Residuals Base
    ## 1039 -1.0216958358 -13.329611032 Residuals Base
    ## 1040 -0.9996327605 -12.974347577 Residuals Base
    ## 1041  0.2277563265   5.172612048 Residuals Base
    ## 1042  0.7532643453  11.098912033 Residuals Base
    ## 1043 -1.3402492670 -16.552189582 Residuals Base
    ## 1044  1.7027491454  15.976586267 Residuals Base
    ## 1045  0.1811871796   4.517570601 Residuals Base
    ## 1046  1.0291615738  12.927727155 Residuals Base
    ## 1047 -0.4122389113  -6.104053239 Residuals Base
    ## 1048  0.6407061541   9.928655261 Residuals Base
    ## 1049  0.6680401230  10.272430218 Residuals Base
    ## 1050 -1.2913098855 -16.133836346 Residuals Base
    ## 1051 -0.8806244384 -11.874360337 Residuals Base
    ## 1052  0.0463539131   2.037692149 Residuals Base
    ## 1053  1.6488498286  15.793604624 Residuals Base
    ## 1054  1.8690222541  16.911826598 Residuals Base
    ## 1055  1.9412327949  17.494760984 Residuals Base
    ## 1056 -0.0331041300   0.413009843 Residuals Base
    ## 1057 -1.6546047723 -19.197863166 Residuals Base
    ## 1058  0.5070935195   8.597884629 Residuals Base
    ## 1059  0.2036653472   4.811999169 Residuals Base
    ## 1060  0.8612788035  11.871726521 Residuals Base
    ## 1061  0.5545165943   8.966089494 Residuals Base
    ## 1062  0.2383370101   5.288388266 Residuals Base
    ## 1063 -0.2141897858  -3.362537800 Residuals Base
    ## 1064 -0.1320394964  -1.808382796 Residuals Base
    ## 1065  0.4591495720   8.134184201 Residuals Base
    ## 1066  0.4805047244   8.254957273 Residuals Base
    ## 1067  0.2368238770   5.281032816 Residuals Base
    ## 1068  0.0036775732   1.292883586 Residuals Base
    ## 1069 -0.5926674102  -8.496823240 Residuals Base
    ## 1070 -0.5070935195  -7.322565904 Residuals Base
    ## 1071  0.2717709776   5.715249631 Residuals Base
    ## 1072  0.2353112859   5.273388289 Residuals Base
    ## 1073  0.7829006666  11.320003980 Residuals Base
    ## 1074  0.1335235476   3.716838490 Residuals Base
    ## 1075 -0.9756753888 -12.825979563 Residuals Base
    ## 1076 -0.6425133777  -9.153310671 Residuals Base
    ## 1077  0.5613917360   9.120141713 Residuals Base
    ## 1078  0.4640587788   8.145454493 Residuals Base
    ## 1079 -0.6032212660  -8.658048698 Residuals Base
    ## 1080  0.8981014700  12.127892012 Residuals Base
    ## 1081  2.9745410111  23.236417331 Residuals Base
    ## 1082 -0.4493641142  -6.690259735 Residuals Base
    ## 1083 -1.7833428114 -20.308782549 Residuals Base
    ## 1084 -1.1778666679 -15.132480313 Residuals Base
    ## 1085  0.7729465895  11.229639353 Residuals Base
    ## 1086  0.0655074774   2.464136283 Residuals Base
    ## 1087  2.4403912761  20.232520826 Residuals Base
    ## 1088  1.1603851778  13.573753171 Residuals Base
    ## 1089  0.3819953837   7.184836454 Residuals Base
    ## 1090  2.3384059923  19.789707058 Residuals Base
    ## 1091  0.8741395644  11.976106367 Residuals Base
    ## 1092 -0.5323500580  -7.716885837 Residuals Base
    ## 1093 -0.3271630041  -5.040898749 Residuals Base
    ## 1094  0.2262469071   5.167210126 Residuals Base
    ## 1095  0.8570234501  11.863426389 Residuals Base
    ## 1096  0.5087670857   8.598233907 Residuals Base
    ## 1097  1.5060970823  15.225462706 Residuals Base
    ## 1098  0.4283075401   7.832087798 Residuals Base
    ## 1099 -0.1513560770  -2.149007903 Residuals Base
    ## 1100 -0.6680401230  -9.470462825 Residuals Base
    ## 1101  0.6317011757   9.852349936 Residuals Base
    ## 1102  0.1767028730   4.451041891 Residuals Base
    ## 1103 -0.5020813071  -7.245133257 Residuals Base
    ## 1104 -0.5874152077  -8.426156829 Residuals Base
    ## 1105  1.0884229125  13.275227668 Residuals Base
    ## 1106  0.8655498104  11.924986905 Residuals Base
    ## 1107  0.3474059220   6.752315771 Residuals Base
    ## 1108 -1.3294927807 -16.406210354 Residuals Base
    ## 1109  0.0492993329   2.082460242 Residuals Base
    ## 1110  0.2232296105   5.086786757 Residuals Base
    ## 1111 -1.1320126694 -14.379622420 Residuals Base
    ## 1112  0.8071137708  11.519863491 Residuals Base
    ## 1113  2.1710210996  18.666068374 Residuals Base
    ## 1114  0.7357966503  10.954241504 Residuals Base
    ## 1115 -0.6846820143  -9.750673135 Residuals Base
    ## 1116 -0.6173986216  -8.837208027 Residuals Base
    ## 1117  1.2139540843  13.820599868 Residuals Base
    ## 1118 -0.7949489602 -11.034839497 Residuals Base
    ## 1119 -0.0979797706  -1.185888293 Residuals Base
    ## 1120 -0.6643670773  -9.459007452 Residuals Base
    ## 1121 -1.6263593197 -18.857131319 Residuals Base
    ## 1122  0.2187074641   5.047595888 Residuals Base
    ## 1123  0.5340457827   8.827739016 Residuals Base
    ## 1124  0.1752088979   4.424200616 Residuals Base
    ## 1125  0.9113913647  12.176825323 Residuals Base
    ## 1126  1.0341707665  12.943367625 Residuals Base
    ## 1127 -1.3084294195 -16.326023776 Residuals Base
    ## 1128 -1.2047848113 -15.256722573 Residuals Base
    ## 1129  0.4904347510   8.412660339 Residuals Base
    ## 1130  0.6735666616  10.336435124 Residuals Base
    ## 1131  0.6156197095   9.729666026 Residuals Base
    ## 1132 -0.6902714885  -9.755265753 Residuals Base
    ## 1133 -0.8380630296 -11.588052299 Residuals Base
    ## 1134  0.8318095865  11.692312577 Residuals Base
    ## 1135  0.9804218384  12.613753274 Residuals Base
    ## 1136  0.8806244384  12.034100332 Residuals Base
    ## 1137 -1.1236766286 -14.339227315 Residuals Base
    ## 1138 -0.5856680754  -8.408992391 Residuals Base
    ## 1139  0.0007355131   1.250506214 Residuals Base
    ## 1140 -0.6461341385  -9.176106268 Residuals Base
    ## 1141 -0.1916649091  -2.937098414 Residuals Base
    ## 1142  2.0486846848  17.918886630 Residuals Base
    ## 1143  0.0419365294   1.915603198 Residuals Base
    ## 1144  0.1916649091   4.699687199 Residuals Base
    ## 1145 -2.3863017759 -24.134517644 Residuals Base
    ## 1146 -1.6375010410 -18.957193664 Residuals Base
    ## 1147  1.0857668422  13.240520896 Residuals Base
    ## 1148  2.0139566548  17.679128835 Residuals Base
    ## 1149  1.5940917210  15.560092865 Residuals Base
    ## 1150  0.3194132752   6.369264662 Residuals Base
    ## 1151 -1.0991248433 -14.152524178 Residuals Base
    ## 1152  1.6662819154  15.835046570 Residuals Base
    ## 1153 -1.5940917210 -18.626428291 Residuals Base
    ## 1154 -0.7128493774 -10.099479951 Residuals Base
    ## 1155  1.0493564707  13.009798099 Residuals Base
    ## 1156  1.0142866142  12.821238016 Residuals Base
    ## 1157  0.9592331289  12.483330311 Residuals Base
    ## 1158  0.3178656436   6.331501467 Residuals Base
    ## 1159 -0.0669817347  -0.416226657 Residuals Base
    ## 1160  0.4026488429   7.392939595 Residuals Base
    ## 1161 -0.7989907516 -11.056924966 Residuals Base
    ## 1162 -1.6319048579 -18.952064102 Residuals Base
    ## 1163 -0.4575156315  -6.740906484 Residuals Base
    ## 1164  0.3116826825   6.212258865 Residuals Base
    ## 1165  0.1737153138   4.398435415 Residuals Base
    ## 1166  0.6977578572  10.693477288 Residuals Base
    ## 1167  0.8871465590  12.096220802 Residuals Base
    ## 1168 -1.9038871529 -21.296562937 Residuals Base
    ## 1169  0.4706218546   8.194024888 Residuals Base
    ## 1170  0.6754134139  10.339195423 Residuals Base
    ## 1171  0.7709649629  11.228266980 Residuals Base
    ## 1172 -0.2202143447  -3.437768035 Residuals Base
    ## 1173 -0.3693666400  -5.691840289 Residuals Base
    ## 1174  0.3740954102   7.066698517 Residuals Base
    ## 1175  0.4607847392   8.134460214 Residuals Base
    ## 1176 -0.6865427880  -9.752946010 Residuals Base
    ## 1177 -0.9592331289 -12.723070879 Residuals Base
    ## 1178 -1.0266666360 -13.397767820 Residuals Base
    ## 1179  0.4656976637   8.155230596 Residuals Base
    ## 1180 -0.5476675641  -8.001223542 Residuals Base
    ## 1181  0.7749312560  11.238410346 Residuals Base
    ## 1182 -2.5027302423 -24.805846772 Residuals Base
    ## 1183 -0.2262469071  -3.566754673 Residuals Base
    ## 1184  0.0965017732   3.134849249 Residuals Base
    ## 1185  1.5341205444  15.279468480 Residuals Base
    ## 1186 -1.7154235234 -19.787155960 Residuals Base
    ## 1187 -1.0884229125 -13.974481409 Residuals Base
    ## 1188 -1.9316416134 -21.399807772 Residuals Base
    ## 1189  0.1024150604   3.217360469 Residuals Base
    ## 1190  0.7989907516  11.447312310 Residuals Base
    ## 1191  1.1264466135  13.472214175 Residuals Base
    ## 1192  1.0991248433  13.339993682 Residuals Base
    ## 1193 -1.1460835983 -14.528679232 Residuals Base
    ## 1194 -0.8091528532 -11.270897511 Residuals Base
    ## 1195  0.6717222036  10.309883247 Residuals Base
    ## 1196  0.3835782275   7.205567799 Residuals Base
    ## 1197  1.7621044997  16.481904798 Residuals Base
    ## 1198 -0.4607847392  -6.768955988 Residuals Base
    ## 1199  0.7849007930  11.355104902 Residuals Base
    ## 1200  0.9180970195  12.237450360 Residuals Base
    ## 1201  1.3259412597  14.256516910 Residuals Base
    ## 1202 -0.9804218384 -12.839745192 Residuals Base
    ## 1203 -1.3734871961 -16.821167973 Residuals Base
    ## 1204 -1.0020601270 -12.998872768 Residuals Base
    ## 1205 -0.4542514060  -6.720807844 Residuals Base
    ## 1206 -0.1931634198  -2.960548878 Residuals Base
    ## 1207 -1.4792088423 -17.735361782 Residuals Base
    ## 1208 -1.3475073079 -16.622651831 Residuals Base
    ## 1209  0.8193992101  11.552655711 Residuals Base
    ## 1210  0.9947956122  12.647108872 Residuals Base
    ## 1211 -0.4250850883  -6.273847455 Residuals Base
    ## 1212 -1.1154179489 -14.301015971 Residuals Base
    ## 1213  0.9875832202  12.633409110 Residuals Base
    ## 1214 -0.0080907312   0.976384843 Residuals Base
    ## 1215 -0.0817328504  -0.893031685 Residuals Base
    ## 1216 -1.4836160909 -17.824344399 Residuals Base
    ## 1217  0.2840025184   5.865872615 Residuals Base
    ## 1218  0.6772624726  10.401868692 Residuals Base
    ## 1219 -1.2947034910 -16.183056542 Residuals Base
    ## 1220 -0.0684561376  -0.417465780 Residuals Base
    ## 1221  1.1575059061  13.564361412 Residuals Base
    ## 1222 -0.7261888527 -10.251805769 Residuals Base
    ## 1223 -0.1841787371  -2.787373012 Residuals Base
    ## 1224  2.7893319350  22.120535130 Residuals Base
    ## 1225 -1.3622402863 -16.766437945 Residuals Base
    ## 1226  0.9639043222  12.510843998 Residuals Base
    ## 1227 -0.2886002242  -4.439738049 Residuals Base
    ## 1228  1.4575919434  15.058909102 Residuals Base
    ## 1229 -2.0992130735 -22.595398209 Residuals Base
    ## 1230 -0.2550183581  -3.980777050 Residuals Base
    ## 1231 -0.9384665588 -12.560946151 Residuals Base
    ## 1232 -0.5821791597  -8.389298761 Residuals Base
    ## 1233  0.5357430444   8.844959626 Residuals Base
    ## 1234 -0.1498682715  -2.142991292 Residuals Base
    ## 1235 -0.5054213724  -7.306529417 Residuals Base
    ## 1236 -1.2078299568 -15.270255720 Residuals Base
    ## 1237  0.8527835594  11.836665690 Residuals Base
    ## 1238 -1.7761741027 -20.297650413 Residuals Base
    ## 1239  0.8359749171  11.732924639 Residuals Base
    ## 1240  1.0673847719  13.088735505 Residuals Base
    ## 1241  0.2932040388   5.997027096 Residuals Base
    ## 1242  0.6643670773  10.241502234 Residuals Base
    ## 1243  1.2778818749  14.098559569 Residuals Base
    ## 1244 -1.4925180831 -17.862038723 Residuals Base
    ## 1245  0.9685966432  12.526879711 Residuals Base
    ## 1246 -0.7300238818 -10.254747511 Residuals Base
    ## 1247 -0.0994579821  -1.235701637 Residuals Base
    ## 1248 -1.4533494264 -17.551861520 Residuals Base
    ## 1249  0.3552292675   6.801549815 Residuals Base
    ## 1250 -0.8235219017 -11.476547439 Residuals Base
    ## 1251 -1.0291615738 -13.414951080 Residuals Base
    ## 1252 -0.0007355131   1.185281628 Residuals Base
    ## 1253 -1.4366354815 -17.490201239 Residuals Base
    ## 1254 -0.6191794895  -8.838743421 Residuals Base
    ## 1255 -0.0728802524  -0.511915524 Residuals Base
    ## 1256  0.1083319310   3.277139879 Residuals Base
    ## 1257  0.4444875324   7.927775498 Residuals Base
    ## 1258  1.6431489813  15.792032493 Residuals Base
    ## 1259  0.2156951883   5.014763331 Residuals Base
    ## 1260  1.8054174044  16.549565813 Residuals Base
    ## 1261  0.7128493774  10.857406233 Residuals Base
    ## 1262 -0.6588742448  -9.396572400 Residuals Base
    ## 1263  1.3697189597  14.533527363 Residuals Base
    ## 1264 -1.3188879573 -16.358201045 Residuals Base
    ## 1265  2.6680580303  21.908249830 Residuals Base
    ## 1266  0.4154440008   7.524901600 Residuals Base
    ## 1267 -0.1602900682  -2.211792229 Residuals Base
    ## 1268  0.5596704740   9.115130748 Residuals Base
    ## 1269  0.6902714885  10.554876401 Residuals Base
    ## 1270 -0.1632708753  -2.236293343 Residuals Base
    ## 1271  1.4043613713  14.716902164 Residuals Base
    ## 1272 -0.1707293042  -2.454637649 Residuals Base
    ## 1273  0.0802569912   2.639230702 Residuals Base
    ## 1274  0.4755574834   8.249743780 Residuals Base
    ## 1275 -0.3474059220  -5.467232440 Residuals Base
    ## 1276 -0.3883325489  -5.812602912 Residuals Base
    ## 1277 -0.8193992101 -11.393260330 Residuals Base
    ## 1278 -0.5391422098  -7.822793725 Residuals Base
    ## 1279 -1.1489251297 -14.529042750 Residuals Base
    ## 1280 -0.0581382615  -0.220623363 Residuals Base
    ## 1281 -0.9113913647 -12.225380620 Residuals Base
    ## 1282 -0.8893289986 -11.981870093 Residuals Base
    ## 1283 -0.5374418509  -7.792098069 Residuals Base
    ## 1284  0.2172010798   5.023748227 Residuals Base
    ## 1285 -0.2172010798  -3.379609280 Residuals Base
    ## 1286  0.3536628734   6.799584726 Residuals Base
    ## 1287 -0.3930956643  -5.865420742 Residuals Base
    ## 1288 -0.3978677147  -5.930250103 Residuals Base
    ## 1289  0.8698366649  11.942173140 Residuals Base
    ## 1290  0.1112917762   3.286812597 Residuals Base
    ## 1291  0.8401548026  11.768909931 Residuals Base
    ## 1292  0.1677448161   4.367918269 Residuals Base
    ## 1293 -0.0714053933  -0.508495873 Residuals Base
    ## 1294 -0.1142525967  -1.530903004 Residuals Base
    ## 1295  1.0621985898  13.072945944 Residuals Base
    ## 1296  2.1266316067  18.394286592 Residuals Base
    ## 1297  0.0920690324   3.039691487 Residuals Base
    ## 1298  0.4010541160   7.305060266 Residuals Base
    ## 1299 -0.5272720298  -7.687504611 Residuals Base
    ## 1300  0.0581382615   2.293775441 Residuals Base
    ## 1301  0.2778815512   5.785487264 Residuals Base
    ## 1302  0.8959018906  12.124525104 Residuals Base
    ## 1303 -0.1186957144  -1.595946056 Residuals Base
    ## 1304  1.7416325040  16.243874088 Residuals Base
    ## 1305  0.5289631892   8.768872273 Residuals Base
    ## 1306  1.0544724518  13.021845584 Residuals Base
    ## 1307  0.1602900682   4.224654256 Residuals Base
    ## 1308  1.1099541620  13.406723260 Residuals Base
    ## 1309 -0.7670107612 -10.709246920 Residuals Base
    ## 1310 -0.4706218546  -6.837706121 Residuals Base
    ## 1311 -0.9293658287 -12.351438793 Residuals Base
    ## 1312 -0.1201772702  -1.618465625 Residuals Base
    ## 1313 -0.7789097776 -10.776273802 Residuals Base
    ## 1314  0.6865427880  10.527048177 Residuals Base
    ## 1315  0.3147726589   6.309994442 Residuals Base
    ## 1316  2.5766418614  21.114548730 Residuals Base
    ## 1317  0.2398506892   5.298508140 Residuals Base
    ## 1318 -0.7242753395 -10.248900128 Residuals Base
    ## 1319  0.2702449274   5.666296891 Residuals Base
    ## 1320 -0.0345759986   0.315707757 Residuals Base
    ## 1321 -0.3070532816  -4.718213625 Residuals Base
    ## 1322  0.0169176058   1.529469028 Residuals Base
    ## 1323  1.9222249015  17.223874595 Residuals Base
    ## 1324  1.3734871961  14.548931913 Residuals Base
    ## 1325  0.2337992330   5.242767015 Residuals Base
    ## 1326  0.7552193656  11.101502982 Residuals Base
    ## 1327  1.0316629343  12.935535458 Residuals Base
    ## 1328  0.3333769433   6.576312530 Residuals Base
    ## 1329 -0.3101388115  -4.776171328 Residuals Base
    ## 1330 -1.8442902952 -20.966016018 Residuals Base
    ## 1331  0.2489444440   5.367483682 Residuals Base
    ## 1332 -1.4491329081 -17.534581234 Residuals Base
    ## 1333 -0.5528019092  -8.028728636 Residuals Base
    ## 1334  0.4202596616   7.632418972 Residuals Base
    ## 1335 -1.1575059061 -14.764230425 Residuals Base
    ## 1336  0.4970816766   8.449869042 Residuals Base
    ## 1337 -0.0787813069  -0.860117595 Residuals Base
    ## 1338 -0.1290722628  -1.758541242 Residuals Base
    ## 1339  1.2047848113  13.753132035 Residuals Base
    ## 1340 -0.2855344152  -4.409764855 Residuals Base
    ## 1341  0.3867468049   7.224037401 Residuals Base
    ## 1342  0.9923857457  12.642683160 Residuals Base
    ## 1343  1.0118292158  12.801995594 Residuals Base
    ## 1344  0.5839227291   9.347438943 Residuals Base
    ## 1345 -0.8359749171 -11.569145343 Residuals Base
    ## 1346  1.7283796147  16.125522045 Residuals Base
    ## 1347 -0.7223644744 -10.241683980 Residuals Base
    ## 1348 -0.0655074774  -0.330401835 Residuals Base
    ## 1349  0.3677922221   7.018290136 Residuals Base
    ## 1350 -1.2294671324 -15.439226973 Residuals Base
    ## 1351 -0.1886691747  -2.894625600 Residuals Base
    ## 1352 -0.5909148660  -8.478097495 Residuals Base
    ## 1353  0.2626240315   5.605221433 Residuals Base
    ## 1354 -0.0110329187   0.955942721 Residuals Base
    ## 1355 -0.4299204333  -6.396171000 Residuals Base
    ## 1356 -0.5442526790  -7.926048338 Residuals Base
    ## 1357  0.8506693538  11.831736260 Residuals Base
    ## 1358  0.8173430796  11.551449545 Residuals Base
    ## 1359 -2.2561532875 -23.297428384 Residuals Base
    ## 1360  0.0301606047   1.775821332 Residuals Base
    ## 1361 -1.3049748599 -16.314217983 Residuals Base
    ## 1362 -0.8318095865 -11.541360798 Residuals Base
    ## 1363  0.6958826120  10.690282735 Residuals Base
    ## 1364  1.4449419977  14.998293978 Residuals Base
    ## 1365 -0.2565382990  -3.993585777 Residuals Base
    ## 1366  0.2901341447   5.990341931 Residuals Base
    ## 1367 -0.6809675576  -9.697222483 Residuals Base
    ## 1368  0.2671947102   5.642100519 Residuals Base
    ## 1369 -0.9069436065 -12.212101944 Residuals Base
    ## 1370 -1.0044934121 -13.056991545 Residuals Base
    ## 1371 -0.6497633899  -9.200848862 Residuals Base
    ## 1372 -0.3899192700  -5.814287647 Residuals Base
    ## 1373  0.3132272969   6.298228851 Residuals Base
    ## 1374 -1.6842355767 -19.676401166 Residuals Base
    ## 1375  0.2292662650   5.188392258 Residuals Base
    ## 1376 -0.5769590244  -8.350912507 Residuals Base
    ## 1377  0.6014576494   9.613029278 Residuals Base
    ## 1378 -0.0404642542   0.240156475 Residuals Base
    ## 1379  0.1098117334   3.283362564 Residuals Base
    ## 1380 -0.2794108083  -4.269272837 Residuals Base
    ## 1381  1.0442678083  12.982034678 Residuals Base
    ## 1382 -2.4124647297 -24.276912063 Residuals Base
    ## 1383 -0.2809407191  -4.351755654 Residuals Base
    ## 1384 -0.1231411766  -1.676690442 Residuals Base
    ## 1385  0.9091652374  12.170737537 Residuals Base
    ## 1386 -0.4805047244  -6.963604639 Residuals Base
    ## 1387  1.5153063709  15.246173482 Residuals Base
    ## 1388 -0.8655498104 -11.826953934 Residuals Base
    ## 1389 -0.3411625419  -5.403868968 Residuals Base
    ## 1390 -2.0029021394 -21.955108219 Residuals Base
    ## 1391 -1.3438694382 -16.586120187 Residuals Base
    ## 1392 -0.5171564526  -7.492704504 Residuals Base
    ## 1393 -1.6903425386 -19.684578213 Residuals Base
    ## 1394  0.0080907312   1.419635655 Residuals Base
    ## 1395 -0.3116826825  -4.783751444 Residuals Base
    ## 1396 -2.2953405577 -23.894546892 Residuals Base
    ## 1397  1.5734687073  15.491050601 Residuals Base
    ## 1398 -0.0036775732   0.992957178 Residuals Base
    ## 1399 -1.0442678083 -13.583905011 Residuals Base
    ## 1400 -1.0544724518 -13.681060064 Residuals Base
    ## 1401 -1.5389099117 -18.304677624 Residuals Base
    ## 1402 -0.7185506323 -10.197035771 Residuals Base
    ## 1403 -0.7909201136 -10.986717222 Residuals Base
    ## 1404 -1.2879310866 -16.112682580 Residuals Base
    ## 1405  0.1379774796   3.761317458 Residuals Base
    ## 1406  0.0183888611   1.551839326 Residuals Base
    ## 1407  0.3364887318   6.621723140 Residuals Base
    ## 1408 -0.7147472132 -10.145769054 Residuals Base
    ## 1409  0.2141897858   4.953819872 Residuals Base
    ## 1410 -0.2687195063  -4.170710813 Residuals Base
    ## 1411  0.1573106846   4.134439503 Residuals Base
    ## 1412  0.4090380510   7.480906653 Residuals Base
    ## 1413 -0.5238942236  -7.656506281 Residuals Base
    ## 1414  0.4122389113   7.487057610 Residuals Base
    ## 1415  1.7833428114  16.528043739 Residuals Base
    ## 1416  2.6196185544  21.601327260 Residuals Base
    ## 1417  0.9996327605  12.673961954 Residuals Base
    ## 1418  0.2824712877   5.832812187 Residuals Base
    ## 1419  0.1961617467   4.729536330 Residuals Base
    ## 1420 -0.9947956122 -12.952836068 Residuals Base
    ## 1421  1.6046626077  15.608976786 Residuals Base
    ## 1422  1.2201240828  13.852129141 Residuals Base
    ## 1423 -0.5154756838  -7.488588992 Residuals Base
    ## 1424  0.9733103881  12.542612531 Residuals Base
    ## 1425  0.6791138497  10.432649911 Residuals Base
    ## 1426  0.2687195063   5.661307076 Residuals Base
    ## 1427  0.4315344458   7.840743939 Residuals Base
    ## 1428 -0.6996355593  -9.859885414 Residuals Base
    ## 1429 -1.9510059497 -21.707579275 Residuals Base
    ## 1430 -0.5734876570  -8.305352188 Residuals Base
    ## 1431 -1.5734687073 -18.532841826 Residuals Base
    ## 1432  0.3055116140   6.116147944 Residuals Base
    ## 1433 -0.9316337759 -12.384655265 Residuals Base
    ## 1434 -0.0492993329   0.032360434 Residuals Base
    ## 1435  1.8206375440  16.647546673 Residuals Base
    ## 1436 -0.1677448161  -2.404090219 Residuals Base
    ## 1437  0.2459109416   5.357222348 Residuals Base
    ## 1438  0.6809675576  10.448369961 Residuals Base
    ## 1439 -0.2006625545  -3.079849504 Residuals Base
    ## 1440  0.1483807977   4.071066827 Residuals Base
    ## 1441 -0.3132272969  -4.813065654 Residuals Base
    ## 1442 -0.7015157313  -9.950588417 Residuals Base
    ## 1443  0.5306558627   8.808425687 Residuals Base
    ## 1444 -0.6921394406  -9.759959972 Residuals Base
    ## 1445 -1.8861681393 -21.238795879 Residuals Base
    ## 1446  1.6965132006  15.944005965 Residuals Base
    ## 1447 -0.0802569912  -0.866626269 Residuals Base
    ## 1448 -1.6154159092 -18.851302505 Residuals Base
    ## 1449 -0.3630744157  -5.640298229 Residuals Base
    ## 1450  0.3851620328   7.214705722 Residuals Base
    ## 1451  0.5979360130   9.601516123 Residuals Base
    ## 1452 -0.4170481453  -6.124847345 Residuals Base
    ## 1453 -1.6046626077 -18.725785713 Residuals Base
    ## 1454  0.1617802921   4.228103942 Residuals Base
    ## 1455  1.3015358040  14.171062349 Residuals Base
    ## 1456 -1.4325191375 -17.487716905 Residuals Base
    ## 1457 -0.0625593865  -0.299796935 Residuals Base
    ## 1458  0.5996959015   9.607295832 Residuals Base
    ## 1459  0.4739109922   8.221129467 Residuals Base
    ## 1460 -0.7377263587 -10.304696417 Residuals Base
    ## 1461  0.7223644744  10.908452485 Residuals Base
    ## 1462  0.9851904790  12.632859270 Residuals Base
    ## 1463 -1.0468087512 -13.628540223 Residuals Base
    ## 1464 -0.7532643453 -10.504424483 Residuals Base
    ## 1465 -2.4403912761 -24.338738278 Residuals Base
    ## 1466 -0.3994604084  -5.960377744 Residuals Base
    ## 1467 -0.8276586380 -11.506635883 Residuals Base
    ## 1468 -1.1072346544 -14.197656458 Residuals Base
    ## 1469 -1.5341205444 -18.261592264 Residuals Base
    ## 1470  1.1154179489  13.418526876 Residuals Base
    ## 1471  0.9545827729  12.471019030 Residuals Base
    ## 1472 -2.0368341317 -22.112856169 Residuals Base
    ## 1473 -1.7621044997 -20.114412492 Residuals Base
    ## 1474  0.3630744157   6.936239899 Residuals Base
    ## 1475  2.3863017759  20.012185923 Residuals Base
    ## 1476 -0.3520973466  -5.544526922 Residuals Base
    ## 1477  0.2474274082   5.364812982 Residuals Base
    ## 1478 -1.1292252684 -14.376382748 Residuals Base
    ## 1479 -1.2420940112 -15.618133626 Residuals Base
    ## 1480 -1.0118292158 -13.169173946 Residuals Base
    ## 1481  0.1186957144   3.496629974 Residuals Base
    ## 1482 -0.8591491821 -11.742970569 Residuals Base
    ## 1483 -0.2840025184  -4.409035491 Residuals Base
    ## 1484 -0.4871194144  -7.043328392 Residuals Base
    ## 1485 -0.6120677137  -8.757680667 Residuals Base
    ## 1486 -0.2187074641  -3.422173964 Residuals Base
    ## 1487  0.5909148660   9.540644993 Residuals Base
    ## 1488 -0.9047264430 -12.208007070 Residuals Base
    ## 1489  1.7349679688  16.198115068 Residuals Base
    ## 1490  0.1142525967   3.380515666 Residuals Base
    ## 1491 -0.5631146629  -8.230038581 Residuals Base
    ## 1492  1.0241780726  12.903418595 Residuals Base
    ## 1493  0.3505326823   6.785289030 Residuals Base
    ## 1494  1.0392060439  12.963820086 Residuals Base
    ## 1495 -1.5993548248 -18.644379956 Residuals Base
    ## 1496  1.3887588134  14.587657226 Residuals Base
    ## 1497 -0.1157333810  -1.531421188 Residuals Base
    ## 1498 -1.1719996838 -15.053633703 Residuals Base
    ## 1499  0.6334980548   9.860730432 Residuals Base
    ## 1500  0.0095618146   1.473581216 Residuals Base
    ## 1501 -1.1749281205 -15.103326293 Residuals Base
    ## 1502  1.1927144598  13.702466979 Residuals Base
    ## 1503  0.1305557359   3.700775397 Residuals Base
    ## 1504 -0.9136220177 -12.225539647 Residuals Base
    ## 1505  0.7338696779  10.952158853 Residuals Base
    ## 1506  1.2078299568  13.756157992 Residuals Base
    ## 1507 -0.4904347510  -7.132858749 Residuals Base
    ## 1508  1.8362915151  16.678939083 Residuals Base
    ## 1509  0.6698800280  10.306401151 Residuals Base
    ## 1510 -0.1901668286  -2.934425682 Residuals Base
    ## 1511 -0.5004133750  -7.241708436 Residuals Base
    ## 1512 -0.9091652374 -12.222589108 Residuals Base
    ## 1513  1.1404281247  13.497722604 Residuals Base
    ## 1514  0.8784587098  12.033577566 Residuals Base
    ## 1515  0.3427221312   6.727157787 Residuals Base
    ## 1516  0.3615036128   6.929825099 Residuals Base
    ## 1517 -0.2748249817  -4.239315548 Residuals Base
    ## 1518  0.4412423475   7.890124452 Residuals Base
    ## 1519 -2.3616769353 -24.095601942 Residuals Base
    ## 1520 -1.1927144598 -15.184960277 Residuals Base
    ## 1521 -0.3804134964  -5.746883110 Residuals Base
    ## 1522 -0.0419365294   0.211225006 Residuals Base
    ## 1523 -0.0596118393  -0.221239372 Residuals Base
    ## 1524 -0.3819953837  -5.749485420 Residuals Base
    ## 1525  0.6662024766  10.270084051 Residuals Base
    ## 1526 -1.3697189597 -16.801253473 Residuals Base
    ## 1527  0.6607029729  10.162073672 Residuals Base
    ## 1528  0.2096764748   4.885089473 Residuals Base
    ## 1529 -1.0570408209 -13.684942123 Residuals Base
    ## 1530 -0.5188386837  -7.553516737 Residuals Base
    ## 1531 -1.1018200634 -14.153497119 Residuals Base
    ## 1532 -0.0537182726  -0.048255489 Residuals Base
    ## 1533 -1.0831184097 -13.889894818 Residuals Base
    ## 1534 -1.6781907900 -19.474172132 Residuals Base
    ## 1535  0.6940098108  10.687217233 Residuals Base
    ## 1536  1.0752183198  13.163561430 Residuals Base
    ## 1537  0.6209623234   9.759678217 Residuals Base
    ## 1538 -1.0910866835 -14.009535100 Residuals Base
    ## 1539 -0.6828236083  -9.718001626 Residuals Base
    ## 1540  0.2217217256   5.082392629 Residuals Base
    ## 1541  1.0167501531  12.822460895 Residuals Base
    ## 1542  1.3188879573  14.231704836 Residuals Base
    ## 1543  2.0992130735  18.255363840 Residuals Base
    ## 1544  0.3772525709   7.074398383 Residuals Base
    ## 1545 -0.0242743124   0.693476894 Residuals Base
    ## 1546  1.1517759683  13.514338822 Residuals Base
    ## 1547  1.1632741016  13.580362578 Residuals Base
    ## 1548 -0.4058413761  -6.018984319 Residuals Base
    ## 1549 -0.6884059419  -9.753316261 Residuals Base
    ## 1550  1.6375010410  15.780238536 Residuals Base
    ## 1551 -0.4363832558  -6.525357615 Residuals Base
    ## 1552 -0.1991618380  -3.035057694 Residuals Base
    ## 1553  1.4162916183  14.802790524 Residuals Base
    ## 1554 -1.3015358040 -16.305017361 Residuals Base
    ## 1555  0.8634123382  11.891886950 Residuals Base
    ## 1556  0.6389010207   9.901523386 Residuals Base
    ## 1557  0.4477374050   7.962998657 Residuals Base
    ## 1558 -0.5205223843  -7.602406388 Residuals Base
    ## 1559  0.0213314944   1.611078155 Residuals Base
    ## 1560 -1.4284269244 -17.398716277 Residuals Base
    ## 1561  0.1439203319   3.997547527 Residuals Base
    ## 1562  1.2581615611  14.027256193 Residuals Base
    ## 1563 -0.5665655447  -8.263809234 Residuals Base
    ## 1564 -0.5357430444  -7.771000619 Residuals Base
    ## 1565 -2.1409633303 -22.763057177 Residuals Base
    ## 1566  1.0044934121  12.698869274 Residuals Base
    ## 1567 -1.0192198782 -13.307437480 Residuals Base
    ## 1568 -1.8775262037 -21.190882314 Residuals Base
    ## 1569  1.1661727667  13.583999663 Residuals Base
    ## 1570 -0.0198601562   0.725193463 Residuals Base
    ## 1571 -0.8784587098 -11.866758696 Residuals Base
    ## 1572  2.7237057581  22.078525687 Residuals Base
    ## 1573  2.2753102675  19.192626923 Residuals Base
    ## 1574 -0.2126848685  -3.315590100 Residuals Base
    ## 1575  0.9476456874  12.440393093 Residuals Base
    ## 1576  0.0242743124   1.699499429 Residuals Base
    ## 1577  0.1246235340   3.578823500 Residuals Base
    ## 1578  0.4138409247   7.505820560 Residuals Base
    ## 1579  0.6552233796  10.108043554 Residuals Base
    ## 1580 -2.0608301310 -22.297798236 Residuals Base
    ## 1581 -0.7319454266 -10.264505808 Residuals Base
    ## 1582  0.3567965336   6.806645446 Residuals Base
    ## 1583  0.4299204333   7.832519813 Residuals Base
    ## 1584  0.0257457987   1.708558195 Residuals Base
    ## 1585 -0.4558829115  -6.728350352 Residuals Base
    ## 1586  0.7052835382  10.756170187 Residuals Base
    ## 1587  1.9815001616  17.564306514 Residuals Base
    ## 1588 -1.8690222541 -21.166245541 Residuals Base
    ## 1589  0.8443494187  11.813877547 Residuals Base
    ## 1590  0.4871194144   8.346551150 Residuals Base
    ## 1591 -0.8050780388 -11.189633386 Residuals Base
    ## 1592 -0.1112917762  -1.393855637 Residuals Base
    ## 1593 -0.8010165484 -11.082787701 Residuals Base
    ## 1594  1.9920870977  17.632389543 Residuals Base
    ## 1595  2.4124647297  20.141848895 Residuals Base
    ## 1596 -0.1737153138  -2.514967309 Residuals Base
    ## 1597 -2.7237057581 -25.986384471 Residuals Base
    ## 1598  1.1236766286  13.452330298 Residuals Base
    ## 1599 -0.7630685161 -10.704878669 Residuals Base
    ## 1600 -1.4407763132 -17.500163315 Residuals Base
    ## 1601 -0.7889104984 -10.940217511 Residuals Base
    ## 1602  0.5682935164   9.195242489 Residuals Base
    ## 1603  0.5272720298   8.743617325 Residuals Base
    ## 1604  0.5821791597   9.345776656 Residuals Base
    ## 1605  0.7415940439  10.976611904 Residuals Base
    ## 1606  1.2845669275  14.102127178 Residuals Base
    ## 1607 -2.0252629033 -22.067411167 Residuals Base
    ## 1608  0.6138427435   9.727254211 Residuals Base
    ## 1609  0.4772052649   8.250753631 Residuals Base
    ## 1610  1.2745606616  14.091854757 Residuals Base
    ## 1611 -0.6227471332  -8.865255736 Residuals Base
    ## 1612 -1.0493564707 -13.646464459 Residuals Base
    ## 1613 -0.4689791952  -6.827750553 Residuals Base
    ## 1614  0.3725182290   7.058738571 Residuals Base
    ## 1615  1.5684161798  15.486841324 Residuals Base
    ## 1616  0.0596118393   2.302575051 Residuals Base
    ## 1617 -0.9025137181 -12.192298490 Residuals Base
    ## 1618  1.2232265734  13.853712600 Residuals Base
    ## 1619  0.7454728545  11.049244130 Residuals Base
    ## 1620 -1.8129749776 -20.470322167 Residuals Base
    ## 1621 -0.8152903987 -11.288661940 Residuals Base
    ## 1622  0.0640333624   2.404944270 Residuals Base
    ## 1623 -1.0621985898 -13.698928612 Residuals Base
    ## 1624 -0.4234755183  -6.229878949 Residuals Base
    ## 1625 -0.3256115005  -5.015188990 Residuals Base
    ## 1626 -0.3709419740  -5.699825245 Residuals Base
    ## 1627  2.2561532875  19.112379345 Residuals Base
    ## 1628 -1.8524088450 -21.013866266 Residuals Base
    ## 1629 -0.6791138497  -9.669885268 Residuals Base
    ## 1630 -0.7090613843 -10.082984036 Residuals Base
    ## 1631  0.1157333810   3.399510305 Residuals Base
    ## 1632 -0.7709649629 -10.724656269 Residuals Base
    ## 1633  0.6263227208   9.805549289 Residuals Base
    ## 1634  0.3411625419   6.713976300 Residuals Base
    ## 1635 -0.9248442136 -12.288126182 Residuals Base
    ## 1636 -1.5534939885 -18.425445654 Residuals Base
    ## 1637 -0.7929329281 -10.997818483 Residuals Base
    ## 1638  1.4083158692  14.744534997 Residuals Base
    ## 1639 -0.7033983866  -9.981498253 Residuals Base
    ## 1640 -0.6138427435  -8.801966587 Residuals Base
    ## 1641  1.3622402863  14.518140239 Residuals Base
    ## 1642  2.0029021394  17.646787652 Residuals Base
    ## 1643 -0.1409482835  -1.919503197 Residuals Base
    ## 1644 -2.5379549161 -24.939676702 Residuals Base
    ## 1645 -0.7281050287 -10.252130493 Residuals Base
    ## 1646 -0.8762970937 -11.866391903 Residuals Base
    ## 1647 -0.4821564157  -6.995150956 Residuals Base
    ## 1648  1.3049748599  14.175592053 Residuals Base
    ## 1649 -0.7650381525 -10.708268158 Residuals Base
    ## 1650  1.6208633506  15.686377351 Residuals Base
    ## 1651 -0.8741395644 -11.854623642 Residuals Base
    ## 1652  0.4363832558   7.848292030 Residuals Base
    ## 1653  0.1350078929   3.736173550 Residuals Base
    ## 1654 -1.4162916183 -17.304813525 Residuals Base
    ## 1655  2.2201520097  18.946069968 Residuals Base
    ## 1656 -0.1261061652  -1.731038050 Residuals Base
    ## 1657  0.8422502582  11.788652545 Residuals Base
    ## 1658  1.2326054444  13.864028229 Residuals Base
    ## 1659 -0.7071711997 -10.011875757 Residuals Base
    ## 1660  0.1275890737   3.600764981 Residuals Base
    ## 1661 -0.5579508685  -8.141660649 Residuals Base
    ## 1662 -0.2993521583  -4.607704420 Residuals Base
    ## 1663 -0.1796920103  -2.637185492 Residuals Base
    ## 1664  0.8297323252  11.666565912 Residuals Base
    ## 1665 -1.3772750370 -16.824907171 Residuals Base
    ## 1666 -0.2778815512  -4.264785664 Residuals Base
    ## 1667  0.2307767263   5.219749981 Residuals Base
    ## 1668 -0.1305557359  -1.774392775 Residuals Base
    ## 1669  0.5926674102   9.585564864 Residuals Base
    ## 1670 -1.7483753059 -20.024319537 Residuals Base
    ## 1671 -0.7729465895 -10.753103277 Residuals Base
    ## 1672 -2.2201520097 -23.117798136 Residuals Base
    ## 1673  0.2550183581   5.500334633 Residuals Base
    ## 1674 -1.8206375440 -20.508416132 Residuals Base
    ## 1675 -0.9225904827 -12.274993557 Residuals Base
    ## 1676  0.9828033651  12.616279575 Residuals Base
    ## 1677 -0.3085956793  -4.739260587 Residuals Base
    ## 1678  0.5154756838   8.666152803 Residuals Base
    ## 1679  1.3084294195  14.204837365 Residuals Base
    ## 1680 -1.1376140191 -14.448963841 Residuals Base
    ## 1681  0.4920944406   8.419771573 Residuals Base
    ## 1682 -0.7591380946 -10.665531216 Residuals Base
    ## 1683  0.0610855466   2.342821583 Residuals Base
    ## 1684 -0.0257457987   0.649474210 Residuals Base
    ## 1685 -0.9339065251 -12.459396410 Residuals Base
    ## 1686 -0.5562329114  -8.115428993 Residuals Base
    ## 1687 -2.1266316067 -22.649425799 Residuals Base
    ## 1688 -2.0732874076 -22.390698346 Residuals Base
    ## 1689  0.9615661028  12.486111421 Residuals Base
    ## 1690 -2.9745410111 -28.380357907 Residuals Base
    ## 1691 -0.5613917360  -8.207997096 Residuals Base
    ## 1692 -0.8827943054 -11.891128375 Residuals Base
    ## 1693 -0.3380458469  -5.354456438 Residuals Base
    ## 1694 -0.2353112859  -3.695542866 Residuals Base
    ## 1695  2.2953405577  19.520226015 Residuals Base
    ## 1696  0.8050780388  11.502049352 Residuals Base
    ## 1697 -0.8612788035 -11.756205485 Residuals Base
    ## 1698  1.3659700731  14.527607678 Residuals Base
    ## 1699  0.5459593257   8.927493031 Residuals Base
    ## 1700  1.7761741027  16.495596961 Residuals Base
    ## 1701  0.3302683796   6.533935343 Residuals Base
    ## 1702 -0.5839227291  -8.389851634 Residuals Base
    ## 1703 -0.3505326823  -5.544247363 Residuals Base
    ## 1704  0.0522451804   2.190732893 Residuals Base
    ## 1705  1.0366851197   6.713308221 Residuals Full
    ## 1706 -0.8111953055  -4.768085407 Residuals Full
    ## 1707 -1.2614142846  -8.485381803 Residuals Full
    ## 1708 -0.9685966432  -6.081805604 Residuals Full
    ## 1709  0.8741395644   5.490701052 Residuals Full
    ## 1710 -1.5106857113 -10.543360891 Residuals Full
    ## 1711  0.2611016951   1.769356551 Residuals Full
    ## 1712 -0.5856680754  -3.529695111 Residuals Full
    ## 1713 -0.6625339132  -3.925760211 Residuals Full
    ## 1714  0.1707293042   1.149422529 Residuals Full
    ## 1715 -0.5665655447  -3.377012334 Residuals Full
    ## 1716 -1.5199596115 -10.676272278 Residuals Full
    ## 1717 -0.3725182290  -2.261952639 Residuals Full
    ## 1718  0.5154756838   3.436371967 Residuals Full
    ## 1719  0.1871719439   1.267654979 Residuals Full
    ## 1720 -0.0551914813  -0.364514222 Residuals Full
    ## 1721 -0.6552233796  -3.885733344 Residuals Full
    ## 1722  1.3926277257   9.106408459 Residuals Full
    ## 1723 -1.8206375440 -12.432631817 Residuals Full
    ## 1724  1.5389099117  10.037994153 Residuals Full
    ## 1725  0.4042445945   2.713581986 Residuals Full
    ## 1726  0.3646461149   2.483788103 Residuals Full
    ## 1727  0.8655498104   5.450056042 Residuals Full
    ## 1728  1.5634033765  10.156530595 Residuals Full
    ## 1729  0.5357430444   3.550387001 Residuals Full
    ## 1730 -0.6334980548  -3.711628583 Residuals Full
    ## 1731 -0.2824712877  -1.818815566 Residuals Full
    ## 1732  1.8861681393  13.256742351 Residuals Full
    ## 1733  0.1083319310   0.736102943 Residuals Full
    ## 1734 -0.8010165484  -4.694836852 Residuals Full
    ## 1735  1.7349679688  11.757296150 Residuals Full
    ## 1736  0.9875832202   6.359809372 Residuals Full
    ## 1737 -0.5188386837  -3.107825558 Residuals Full
    ## 1738 -0.5648392630  -3.367805099 Residuals Full
    ## 1739  0.8091528532   5.237789465 Residuals Full
    ## 1740  1.1018200634   7.142503733 Residuals Full
    ## 1741  0.2398506892   1.627298584 Residuals Full
    ## 1742  1.4122925138   9.219943515 Residuals Full
    ## 1743  1.1209152388   7.209953476 Residuals Full
    ## 1744  0.2534990061   1.722418050 Residuals Full
    ## 1745  0.3962760297   2.651582898 Residuals Full
    ## 1746 -0.2126848685  -1.381818792 Residuals Full
    ## 1747  0.7789097776   5.082459016 Residuals Full
    ## 1748 -0.6996355593  -4.077684192 Residuals Full
    ## 1749  0.0817328504   0.510999377 Residuals Full
    ## 1750 -1.1603851778  -7.560396630 Residuals Full
    ## 1751 -1.4243584932  -9.898235524 Residuals Full
    ## 1752  0.5665655447   3.806100491 Residuals Full
    ## 1753 -2.2377901695 -16.823250699 Residuals Full
    ## 1754 -1.0192198782  -6.434895254 Residuals Full
    ## 1755  0.2870669824   1.900379892 Residuals Full
    ## 1756 -0.4607847392  -2.841764889 Residuals Full
    ## 1757  1.2017507969   7.685652745 Residuals Full
    ## 1758 -0.6772624726  -3.975685453 Residuals Full
    ## 1759 -0.7415940439  -4.354870149 Residuals Full
    ## 1760  1.0417335898   6.746784115 Residuals Full
    ## 1761 -0.0286889416  -0.220457165 Residuals Full
    ## 1762  1.0291615738   6.637781100 Residuals Full
    ## 1763  2.0139566548  14.210648160 Residuals Full
    ## 1764 -1.2232265734  -8.146301362 Residuals Full
    ## 1765 -1.2745606616  -8.605084387 Residuals Full
    ## 1766  1.9129756194  13.560026153 Residuals Full
    ## 1767 -0.8173430796  -4.797267256 Residuals Full
    ## 1768  1.6903425386  11.490414594 Residuals Full
    ## 1769 -0.1394627277  -0.791936468 Residuals Full
    ## 1770  1.3965175965   9.130235623 Residuals Full
    ## 1771  0.2337992330   1.588252078 Residuals Full
    ## 1772 -0.5054213724  -3.029514437 Residuals Full
    ## 1773 -1.5993548248 -11.049423306 Residuals Full
    ## 1774  1.1045233111   7.159860467 Residuals Full
    ## 1775 -0.4363832558  -2.697152341 Residuals Full
    ## 1776 -1.3772750370  -9.660887160 Residuals Full
    ## 1777 -0.4058413761  -2.470747592 Residuals Full
    ## 1778 -0.5682935164  -3.377387295 Residuals Full
    ## 1779  0.5171564526   3.436698199 Residuals Full
    ## 1780  1.2712534480   8.062225193 Residuals Full
    ## 1781  1.2170332922   7.767451942 Residuals Full
    ## 1782 -1.1292252684  -7.384583851 Residuals Full
    ## 1783  0.2732976610   1.829746138 Residuals Full
    ## 1784 -0.4266957603  -2.622425995 Residuals Full
    ## 1785 -1.0468087512  -6.622089427 Residuals Full
    ## 1786  1.0519110197   6.816108209 Residuals Full
    ## 1787  0.1186957144   0.791142151 Residuals Full
    ## 1788 -0.7591380946  -4.483046509 Residuals Full
    ## 1789  0.1722221170   1.177067150 Residuals Full
    ## 1790  0.6370979668   4.262786531 Residuals Full
    ## 1791 -0.5804373583  -3.516564891 Residuals Full
    ## 1792 -1.1778666679  -7.642509089 Residuals Full
    ## 1793 -0.4624211394  -2.843552918 Residuals Full
    ## 1794  0.9316337759   5.919761613 Residuals Full
    ## 1795 -0.3225108391  -1.994935062 Residuals Full
    ## 1796 -0.3756735225  -2.287924637 Residuals Full
    ## 1797 -0.3740954102  -2.262492730 Residuals Full
    ## 1798 -0.9453434393  -5.854209275 Residuals Full
    ## 1799 -1.0266666360  -6.539041925 Residuals Full
    ## 1800  1.9510059497  13.719929506 Residuals Full
    ## 1801 -1.5888724072 -11.004627850 Residuals Full
    ## 1802 -1.4748301398 -10.229745744 Residuals Full
    ## 1803 -0.3505326823  -2.132066332 Residuals Full
    ## 1804  0.1856751326   1.254120649 Residuals Full
    ## 1805 -0.0596118393  -0.384264188 Residuals Full
    ## 1806  1.6154159092  10.645975005 Residuals Full
    ## 1807  0.7090613843   4.691980129 Residuals Full
    ## 1808  0.2262469071   1.541228016 Residuals Full
    ## 1809  1.0316629343   6.694655180 Residuals Full
    ## 1810  0.9923857457   6.405931383 Residuals Full
    ## 1811  1.4925180831   9.739576470 Residuals Full
    ## 1812 -0.3899192700  -2.362369958 Residuals Full
    ## 1813 -0.9271026518  -5.736356874 Residuals Full
    ## 1814 -0.7474164701  -4.392415459 Residuals Full
    ## 1815 -0.4042445945  -2.465796962 Residuals Full
    ## 1816  0.8959018906   5.606950718 Residuals Full
    ## 1817 -0.6754134139  -3.973099050 Residuals Full
    ## 1818  1.1236766286   7.214340698 Residuals Full
    ## 1819 -1.0621985898  -6.810436535 Residuals Full
    ## 1820  0.4689791952   3.167608207 Residuals Full
    ## 1821  2.1409633303  15.341833408 Residuals Full
    ## 1822 -0.2156951883  -1.394506956 Residuals Full
    ## 1823  0.9662478233   6.241397036 Residuals Full
    ## 1824 -1.1661727667  -7.568351689 Residuals Full
    ## 1825 -0.0699306894  -0.440201815 Residuals Full
    ## 1826  1.3188879573   8.516773383 Residuals Full
    ## 1827 -0.1543326968  -0.880457583 Residuals Full
    ## 1828 -0.1722221170  -0.977704392 Residuals Full
    ## 1829  0.8401548026   5.315543215 Residuals Full
    ## 1830 -1.0392060439  -6.588767396 Residuals Full
    ## 1831  0.1394627277   0.943072519 Residuals Full
    ## 1832 -0.7869040643  -4.627086404 Residuals Full
    ## 1833 -0.4250850883  -2.621273016 Residuals Full
    ## 1834  0.3567965336   2.453856072 Residuals Full
    ## 1835 -1.3188879573  -8.954263461 Residuals Full
    ## 1836  0.7829006666   5.104864850 Residuals Full
    ## 1837 -2.3163364415 -19.481655021 Residuals Full
    ## 1838 -0.0169176058  -0.155462947 Residuals Full
    ## 1839  0.4937554869   3.332645101 Residuals Full
    ## 1840  2.0029021394  14.063616036 Residuals Full
    ## 1841 -0.9972112697  -6.326271509 Residuals Full
    ## 1842 -0.4315344458  -2.661044898 Residuals Full
    ## 1843  0.7591380946   4.936567089 Residuals Full
    ## 1844  2.0368341317  14.494664631 Residuals Full
    ## 1845  1.2581615611   7.949956299 Residuals Full
    ## 1846  0.2886002242   1.902223362 Residuals Full
    ## 1847  0.1901668286   1.281245638 Residuals Full
    ## 1848 -0.6407061541  -3.762876885 Residuals Full
    ## 1849 -1.7416325040 -11.918533283 Residuals Full
    ## 1850 -0.9025137181  -5.334602777 Residuals Full
    ## 1851  0.3240607803   2.216522491 Residuals Full
    ## 1852 -1.7483753059 -11.926492333 Residuals Full
    ## 1853  0.2051674309   1.384683340 Residuals Full
    ## 1854 -1.8284085249 -12.532441670 Residuals Full
    ## 1855  0.4461118797   3.010858897 Residuals Full
    ## 1856  0.8276586380   5.285053126 Residuals Full
    ## 1857 -0.4074391931  -2.497251490 Residuals Full
    ## 1858  0.9248442136   5.885658672 Residuals Full
    ## 1859  1.7218654404  11.724435953 Residuals Full
    ## 1860 -0.7709649629  -4.533420921 Residuals Full
    ## 1861  0.4234755183   2.913028865 Residuals Full
    ## 1862  0.0095618146   0.017053906 Residuals Full
    ## 1863 -0.1826827540  -1.093810376 Residuals Full
    ## 1864  1.6319048579  10.752476022 Residuals Full
    ## 1865  0.3552292675   2.427632326 Residuals Full
    ## 1866 -1.2139540843  -8.138769127 Residuals Full
    ## 1867  1.4748301398   9.608334024 Residuals Full
    ## 1868  0.4380018029   2.978724518 Residuals Full
    ## 1869 -0.1290722628  -0.729311550 Residuals Full
    ## 1870  1.5341205444   9.947630024 Residuals Full
    ## 1871  0.7989907516   5.174444823 Residuals Full
    ## 1872 -1.0778442096  -6.893026579 Residuals Full
    ## 1873  0.0213314944   0.089844813 Residuals Full
    ## 1874  0.2066699775   1.402599305 Residuals Full
    ## 1875  1.2913098855   8.127660613 Residuals Full
    ## 1876  0.8255885039   5.282839707 Residuals Full
    ## 1877 -0.1320394964  -0.749183315 Residuals Full
    ## 1878  0.4987468338   3.334634648 Residuals Full
    ## 1879  0.6334980548   4.254471291 Residuals Full
    ## 1880 -1.3887588134  -9.684937771 Residuals Full
    ## 1881 -0.4461118797  -2.757257106 Residuals Full
    ## 1882 -1.5734687073 -10.893376538 Residuals Full
    ## 1883  0.9709508189   6.261149965 Residuals Full
    ## 1884  1.1690812635   7.421522020 Residuals Full
    ## 1885 -0.4558829115  -2.796192994 Residuals Full
    ## 1886 -0.1009364109  -0.588512679 Residuals Full
    ## 1887  0.2413649180   1.647931186 Residuals Full
    ## 1888 -0.3630744157  -2.233426715 Residuals Full
    ## 1889 -1.5389099117 -10.794532496 Residuals Full
    ## 1890 -0.6865427880  -4.012344609 Residuals Full
    ## 1891  0.8010165484   5.179278938 Residuals Full
    ## 1892  0.9047264430   5.724360425 Residuals Full
    ## 1893 -1.3294927807  -9.082231283 Residuals Full
    ## 1894  1.9711307685  13.802038624 Residuals Full
    ## 1895  1.6965132006  11.510353408 Residuals Full
    ## 1896 -0.3662187154  -2.245466427 Residuals Full
    ## 1897  0.7357966503   4.818421002 Residuals Full
    ## 1898 -0.7128493774  -4.141565919 Residuals Full
    ## 1899 -0.7147472132  -4.146893792 Residuals Full
    ## 1900 -0.0950239865  -0.580457018 Residuals Full
    ## 1901 -0.3178656436  -1.978861536 Residuals Full
    ## 1902  1.2981120729   8.339769824 Residuals Full
    ## 1903  0.9972112697   6.440633717 Residuals Full
    ## 1904 -0.8612788035  -5.096331718 Residuals Full
    ## 1905  0.3788325605   2.581854659 Residuals Full
    ## 1906  0.7052835382   4.652426677 Residuals Full
    ## 1907 -0.7223644744  -4.246593751 Residuals Full
    ## 1908 -0.1811871796  -1.084748146 Residuals Full
    ## 1909 -1.5485959787 -10.816793421 Residuals Full
    ## 1910  0.1662531338   1.094461756 Residuals Full
    ## 1911 -0.4854637540  -2.943190226 Residuals Full
    ## 1912  1.5836960207  10.397290917 Residuals Full
    ## 1913 -0.6662024766  -3.953697256 Residuals Full
    ## 1914 -0.3349324322  -2.064845949 Residuals Full
    ## 1915  0.1468936521   0.984058871 Residuals Full
    ## 1916  0.9203414283   5.826657100 Residuals Full
    ## 1917  1.4575919434   9.503071789 Residuals Full
    ## 1918  1.6375010410  10.896066325 Residuals Full
    ## 1919  0.4755574834   3.211456263 Residuals Full
    ## 1920 -0.4428643570  -2.730681446 Residuals Full
    ## 1921 -0.9476456874  -5.896398808 Residuals Full
    ## 1922 -0.5562329114  -3.308846651 Residuals Full
    ## 1923  0.8676912444   5.468632239 Residuals Full
    ## 1924  0.5004133750   3.346152930 Residuals Full
    ## 1925  1.4325191375   9.334157334 Residuals Full
    ## 1926  1.1603851778   7.371516747 Residuals Full
    ## 1927  0.6102946102   4.117663990 Residuals Full
    ## 1928 -0.1454068313  -0.821194731 Residuals Full
    ## 1929 -0.7357966503  -4.300796241 Residuals Full
    ## 1930  0.1024150604   0.681837848 Residuals Full
    ## 1931 -0.2565382990  -1.646448396 Residuals Full
    ## 1932  0.5137963699   3.435859063 Residuals Full
    ## 1933  1.0118292158   6.584283674 Residuals Full
    ## 1934 -0.2036653472  -1.252825208 Residuals Full
    ## 1935  0.6191794895   4.177343682 Residuals Full
    ## 1936 -2.2561532875 -17.267768454 Residuals Full
    ## 1937  1.2139540843   7.763088863 Residuals Full
    ## 1938  0.2595799635   1.768572557 Residuals Full
    ## 1939  0.2156951883   1.460803495 Residuals Full
    ## 1940 -0.9136220177  -5.565087928 Residuals Full
    ## 1941  2.1127238216  15.254761630 Residuals Full
    ## 1942 -0.5528019092  -3.291920452 Residuals Full
    ## 1943  0.8784587098   5.500209140 Residuals Full
    ## 1944  0.2550183581   1.724300029 Residuals Full
    ## 1945 -0.3567965336  -2.202060229 Residuals Full
    ## 1946  0.0007355131  -0.013912408 Residuals Full
    ## 1947 -1.3118996649  -8.916821545 Residuals Full
    ## 1948  1.6100159871  10.602433652 Residuals Full
    ## 1949  0.5648392630   3.797408244 Residuals Full
    ## 1950 -0.2398506892  -1.524229979 Residuals Full
    ## 1951 -0.4871194144  -2.952998274 Residuals Full
    ## 1952  0.9685966432   6.254971580 Residuals Full
    ## 1953  1.3734871961   9.038668019 Residuals Full
    ## 1954 -0.6191794895  -3.657593975 Residuals Full
    ## 1955  0.0228028787   0.107713509 Residuals Full
    ## 1956 -0.0537182726  -0.360996259 Residuals Full
    ## 1957 -0.7242753395  -4.271153183 Residuals Full
    ## 1958  1.0752183198   6.932699290 Residuals Full
    ## 1959 -0.9804218384  -6.238039413 Residuals Full
    ## 1960  1.6488498286  10.991567779 Residuals Full
    ## 1961  0.0389920668   0.234164353 Residuals Full
    ## 1962 -0.3978677147  -2.430500405 Residuals Full
    ## 1963 -0.0610855466  -0.386262944 Residuals Full
    ## 1964 -2.0139566548 -14.108110872 Residuals Full
    ## 1965 -1.5060970823 -10.442884053 Residuals Full
    ## 1966 -0.4954178966  -2.973918417 Residuals Full
    ## 1967 -0.0891148820  -0.537972041 Residuals Full
    ## 1968 -1.1927144598  -7.746453422 Residuals Full
    ## 1969 -0.9430461909  -5.849850545 Residuals Full
    ## 1970  0.4186533637   2.876092333 Residuals Full
    ## 1971  0.7889104984   5.125566289 Residuals Full
    ## 1972 -0.7454728545  -4.374309613 Residuals Full
    ## 1973 -1.1517759683  -7.536728760 Residuals Full
    ## 1974 -0.1246235340  -0.704597667 Residuals Full
    ## 1975  0.4591495720   3.114347438 Residuals Full
    ## 1976  0.7493629134   4.894850571 Residuals Full
    ## 1977  0.1961617467   1.324456179 Residuals Full
    ## 1978 -0.5222075618  -3.112621811 Residuals Full
    ## 1979 -1.1154179489  -7.321822310 Residuals Full
    ## 1980 -2.7237057581 -21.370120873 Residuals Full
    ## 1981  1.7906043561  12.185753339 Residuals Full
    ## 1982 -0.2611016951  -1.666060732 Residuals Full
    ## 1983 -0.8762970937  -5.182290935 Residuals Full
    ## 1984 -0.2368238770  -1.499984394 Residuals Full
    ## 1985 -1.9609690869 -13.608680270 Residuals Full
    ## 1986  0.1305557359   0.891428002 Residuals Full
    ## 1987 -0.5734876570  -3.444505215 Residuals Full
    ## 1988  0.9639043222   6.195404692 Residuals Full
    ## 1989  0.3883325489   2.613003063 Residuals Full
    ## 1990 -0.2428797004  -1.587836262 Residuals Full
    ## 1991 -0.5425476160  -3.251172489 Residuals Full
    ## 1992  1.3511630985   8.811278255 Residuals Full
    ## 1993  0.5944217766   3.969586095 Residuals Full
    ## 1994  0.0507722015   0.324685060 Residuals Full
    ## 1995 -0.5961779745  -3.586397384 Residuals Full
    ## 1996  0.5374418509   3.557098515 Residuals Full
    ## 1997 -1.5293661104 -10.725784660 Residuals Full
    ## 1998  0.1320394964   0.903165758 Residuals Full
    ## 1999  0.1261061652   0.871099681 Residuals Full
    ## 2000  0.7396588182   4.833646537 Residuals Full
    ## 2001  0.5070935195   3.386997469 Residuals Full
    ## 2002 -0.6425133777  -3.766064306 Residuals Full
    ## 2003 -0.3194132752  -1.985162096 Residuals Full
    ## 2004  0.5528019092   3.714916759 Residuals Full
    ## 2005 -0.3788325605  -2.306192113 Residuals Full
    ## 2006  0.6772624726   4.484086429 Residuals Full
    ## 2007 -0.3915069734  -2.390413227 Residuals Full
    ## 2008 -0.1172144192  -0.687077436 Residuals Full
    ## 2009 -1.2845669275  -8.679740242 Residuals Full
    ## 2010 -0.3396037821  -2.076989286 Residuals Full
    ## 2011  0.1335235476   0.906605164 Residuals Full
    ## 2012 -0.6389010207  -3.747836362 Residuals Full
    ## 2013 -0.5493774022  -3.266587648 Residuals Full
    ## 2014  0.4739109922   3.195978516 Residuals Full
    ## 2015 -0.1692368717  -0.940821702 Residuals Full
    ## 2016  0.4138409247   2.801513110 Residuals Full
    ## 2017  1.5106857113   9.851746343 Residuals Full
    ## 2018 -0.8591491821  -5.082171623 Residuals Full
    ## 2019 -1.9129756194 -13.338061043 Residuals Full
    ## 2020 -0.6120677137  -3.635358331 Residuals Full
    ## 2021  0.7071711997   4.670093694 Residuals Full
    ## 2022 -1.6154159092 -11.149598746 Residuals Full
    ## 2023  0.6173986216   4.170033972 Residuals Full
    ## 2024  0.2748249817   1.854730878 Residuals Full
    ## 2025 -1.6722067086 -11.366841009 Residuals Full
    ## 2026 -0.9947956122  -6.325516746 Residuals Full
    ## 2027  2.1557487871  15.371937893 Residuals Full
    ## 2028  0.9091652374   5.739277642 Residuals Full
    ## 2029  1.3084294195   8.418185165 Residuals Full
    ## 2030 -0.2232296105  -1.424522185 Residuals Full
    ## 2031 -0.9709508189  -6.201799089 Residuals Full
    ## 2032  0.0154463870   0.040365061 Residuals Full
    ## 2033 -0.5996959015  -3.596077237 Residuals Full
    ## 2034 -0.8981014700  -5.330985658 Residuals Full
    ## 2035 -0.1752088979  -0.984120916 Residuals Full
    ## 2036 -0.1916649091  -1.167724069 Residuals Full
    ## 2037  1.1072346544   7.161712458 Residuals Full
    ## 2038  0.0345759986   0.167263493 Residuals Full
    ## 2039  0.7513121999   4.895347352 Residuals Full
    ## 2040  0.7552193656   4.918223257 Residuals Full
    ## 2041 -0.1662531338  -0.936796740 Residuals Full
    ## 2042  1.9920870977  13.913312611 Residuals Full
    ## 2043 -0.1335235476  -0.759270804 Residuals Full
    ## 2044  1.5437348411  10.057329802 Residuals Full
    ## 2045 -0.9899816288  -6.289760964 Residuals Full
    ## 2046 -1.7690955269 -12.043165642 Residuals Full
    ## 2047 -0.7929329281  -4.654414968 Residuals Full
    ## 2048 -0.0684561376  -0.433396306 Residuals Full
    ## 2049  3.4376182301  19.974431104 Residuals Full
    ## 2050 -1.0964375840  -7.029443081 Residuals Full
    ## 2051 -0.6607029729  -3.904853189 Residuals Full
    ## 2052 -0.8193992101  -4.832558672 Residuals Full
    ## 2053 -0.7611018357  -4.489679650 Residuals Full
    ## 2054 -1.2947034910  -8.823009529 Residuals Full
    ## 2055  1.5940917210  10.514318611 Residuals Full
    ## 2056 -1.2326054444  -8.216401065 Residuals Full
    ## 2057  1.0069326592   6.561002270 Residuals Full
    ## 2058 -0.3163187730  -1.975240512 Residuals Full
    ## 2059  0.0080907312   0.010148865 Residuals Full
    ## 2060  1.1460835983   7.300147348 Residuals Full
    ## 2061  0.9476456874   6.110179846 Residuals Full
    ## 2062  0.8762970937   5.495122509 Residuals Full
    ## 2063  0.9113913647   5.744252017 Residuals Full
    ## 2064 -0.2489444440  -1.621286132 Residuals Full
    ## 2065 -1.4083158692  -9.847525289 Residuals Full
    ## 2066 -0.8359749171  -4.966686123 Residuals Full
    ## 2067  0.7128493774   4.703797901 Residuals Full
    ## 2068 -0.9069436065  -5.347456257 Residuals Full
    ## 2069 -1.3965175965  -9.720057715 Residuals Full
    ## 2070  2.7893319350  19.115457578 Residuals Full
    ## 2071 -1.7551985485 -11.935533861 Residuals Full
    ## 2072 -1.6781907900 -11.374517817 Residuals Full
    ## 2073 -0.4937554869  -2.970098212 Residuals Full
    ## 2074 -1.2357559435  -8.254792186 Residuals Full
    ## 2075 -1.4449419977 -10.071695615 Residuals Full
    ## 2076 -0.0183888611  -0.163354466 Residuals Full
    ## 2077  0.8893289986   5.580759770 Residuals Full
    ## 2078  0.0684561376   0.421630844 Residuals Full
    ## 2079 -0.2687195063  -1.703983720 Residuals Full
    ## 2080  0.1991618380   1.340438869 Residuals Full
    ## 2081 -0.5839227291  -3.525539252 Residuals Full
    ## 2082  0.3070532816   2.061146668 Residuals Full
    ## 2083  0.8806244384   5.525757102 Residuals Full
    ## 2084  0.6352969817   4.260035097 Residuals Full
    ## 2085  0.1617802921   1.076557135 Residuals Full
    ## 2086 -0.6049867608  -3.604214433 Residuals Full
    ## 2087 -0.1157333810  -0.659735647 Residuals Full
    ## 2088 -0.4722657847  -2.878058477 Residuals Full
    ## 2089  1.2549220950   7.916260150 Residuals Full
    ## 2090  0.3740954102   2.548995515 Residuals Full
    ## 2091  1.4203135025   9.285083819 Residuals Full
    ## 2092 -0.3520973466  -2.145477230 Residuals Full
    ## 2093 -0.0228028787  -0.176888099 Residuals Full
    ## 2094 -2.5027302423 -20.436231952 Residuals Full
    ## 2095 -1.4792088423 -10.285092205 Residuals Full
    ## 2096 -0.8464523063  -5.050987543 Residuals Full
    ## 2097  0.4575156315   3.113703001 Residuals Full
    ## 2098  1.0964375840   7.095666078 Residuals Full
    ## 2099 -1.7027491454 -11.595048147 Residuals Full
    ## 2100 -0.5579508685  -3.316385416 Residuals Full
    ## 2101  1.2263408830   7.808282452 Residuals Full
    ## 2102  1.1404281247   7.293215701 Residuals Full
    ## 2103  0.9615661028   6.191310653 Residuals Full
    ## 2104  0.7949489602   5.145936309 Residuals Full
    ## 2105 -1.0596161818  -6.789438807 Residuals Full
    ## 2106 -0.5205223843  -3.109562261 Residuals Full
    ## 2107  0.7281050287   4.775639109 Residuals Full
    ## 2108  0.7969682285   5.166874365 Residuals Full
    ## 2109  0.1231411766   0.840613301 Residuals Full
    ## 2110  0.0301606047   0.149805509 Residuals Full
    ## 2111 -0.3256115005  -2.008058687 Residuals Full
    ## 2112  0.6156197095   4.150701896 Residuals Full
    ## 2113 -0.8235219017  -4.878321654 Residuals Full
    ## 2114 -0.0375199638  -0.285231168 Residuals Full
    ## 2115  0.5631146629   3.796884447 Residuals Full
    ## 2116  0.3256115005   2.248832972 Residuals Full
    ## 2117  0.2641469768   1.790624293 Residuals Full
    ## 2118  0.9025137181   5.723271912 Residuals Full
    ## 2119 -0.6735666616  -3.968690391 Residuals Full
    ## 2120 -0.0492993329  -0.353171733 Residuals Full
    ## 2121 -2.1266316067 -15.159596311 Residuals Full
    ## 2122 -0.2096764748  -1.363649561 Residuals Full
    ## 2123 -1.1837744786  -7.662838569 Residuals Full
    ## 2124 -0.0743552701  -0.450450529 Residuals Full
    ## 2125 -0.0080907312  -0.072322588 Residuals Full
    ## 2126 -2.1710210996 -15.933054775 Residuals Full
    ## 2127 -0.1617802921  -0.928157041 Residuals Full
    ## 2128 -0.2809407191  -1.815265769 Residuals Full
    ## 2129  0.4805047244   3.229834805 Residuals Full
    ## 2130 -0.1781972426  -1.051664904 Residuals Full
    ## 2131 -1.8524088450 -12.902823443 Residuals Full
    ## 2132  1.6431489813  10.916537805 Residuals Full
    ## 2133 -0.1483807977  -0.831760731 Residuals Full
    ## 2134  0.5734876570   3.897394109 Residuals Full
    ## 2135  0.1409482835   0.951951206 Residuals Full
    ## 2136  1.5485959787  10.067283608 Residuals Full
    ## 2137  0.4821564157   3.250452550 Residuals Full
    ## 2138  0.5839227291   3.942804092 Residuals Full
    ## 2139 -2.3384059923 -19.713868508 Residuals Full
    ## 2140 -0.6370979668  -3.740094383 Residuals Full
    ## 2141  0.5493774022   3.677927889 Residuals Full
    ## 2142 -1.3330611506  -9.085937540 Residuals Full
    ## 2143  0.6407061541   4.276723095 Residuals Full
    ## 2144  1.5684161798  10.161238579 Residuals Full
    ## 2145  0.4315344458   2.948576372 Residuals Full
    ## 2146 -0.4509920134  -2.789442640 Residuals Full
    ## 2147  1.0778442096   6.933481031 Residuals Full
    ## 2148  1.5199596115   9.877094623 Residuals Full
    ## 2149 -0.3804134964  -2.309259367 Residuals Full
    ## 2150 -0.5137963699  -3.079299038 Residuals Full
    ## 2151  0.1379774796   0.938086011 Residuals Full
    ## 2152 -0.4689791952  -2.869546175 Residuals Full
    ## 2153 -0.6497633899  -3.818528894 Residuals Full
    ## 2154 -0.4090380510  -2.498740648 Residuals Full
    ## 2155  0.4526211086   3.079395226 Residuals Full
    ## 2156  0.7109541057   4.697979394 Residuals Full
    ## 2157  2.2753102675  15.843872044 Residuals Full
    ## 2158  0.4871194144   3.316803445 Residuals Full
    ## 2159  2.0486846848  14.531070535 Residuals Full
    ## 2160  1.3438694382   8.741866101 Residuals Full
    ## 2161 -0.5596704740  -3.325738672 Residuals Full
    ## 2162  0.1647618214   1.089675524 Residuals Full
    ## 2163  0.3615036128   2.475435823 Residuals Full
    ## 2164 -0.0066196653  -0.067986458 Residuals Full
    ## 2165 -1.6488498286 -11.312242889 Residuals Full
    ## 2166  2.3616769353  15.993377924 Residuals Full
    ## 2167  0.9756753888   6.275865038 Residuals Full
    ## 2168  0.3520973466   2.391714390 Residuals Full
    ## 2169  0.6425133777   4.279692940 Residuals Full
    ## 2170 -0.0669817347  -0.417921866 Residuals Full
    ## 2171  0.2096764748   1.431435380 Residuals Full
    ## 2172 -0.6479476974  -3.808145725 Residuals Full
    ## 2173  0.2717709776   1.828958620 Residuals Full
    ## 2174  0.5752224743   3.902462283 Residuals Full
    ## 2175 -0.3962760297  -2.415409079 Residuals Full
    ## 2176 -1.9815001616 -13.722488344 Residuals Full
    ## 2177 -0.4920944406  -2.967866053 Residuals Full
    ## 2178  0.7454728545   4.880522088 Residuals Full
    ## 2179 -1.2078299568  -8.033738226 Residuals Full
    ## 2180  0.4396214981   2.980727313 Residuals Full
    ## 2181  0.5613917360   3.783930178 Residuals Full
    ## 2182 -2.0486846848 -14.277967088 Residuals Full
    ## 2183 -1.7621044997 -11.956587772 Residuals Full
    ## 2184  0.0448813556   0.293352029 Residuals Full
    ## 2185 -1.6546047723 -11.315893483 Residuals Full
    ## 2186  0.9339065251   5.949070035 Residuals Full
    ## 2187  1.0442678083   6.773862891 Residuals Full
    ## 2188 -0.2383370101  -1.518779111 Residuals Full
    ## 2189  0.5700231867   3.854345115 Residuals Full
    ## 2190 -1.4407763132  -9.969414252 Residuals Full
    ## 2191 -0.6281135191  -3.704381817 Residuals Full
    ## 2192 -0.7493629134  -4.402834894 Residuals Full
    ## 2193  2.7237057581  18.348264609 Residuals Full
    ## 2194  0.8698366649   5.482479811 Residuals Full
    ## 2195  0.3132272969   2.103391681 Residuals Full
    ## 2196  0.4788543430   3.227384903 Residuals Full
    ## 2197  0.3024304519   2.044138909 Residuals Full
    ## 2198 -0.1305557359  -0.748189775 Residuals Full
    ## 2199  0.6389010207   4.264890294 Residuals Full
    ## 2200  2.0860749877  15.109622274 Residuals Full
    ## 2201 -0.1632708753  -0.930466874 Residuals Full
    ## 2202 -0.1068523659  -0.627371332 Residuals Full
    ## 2203  0.6643670773   4.422807527 Residuals Full
    ## 2204 -0.5821791597  -3.517290101 Residuals Full
    ## 2205  0.0492993329   0.305923182 Residuals Full
    ## 2206  0.8030456378   5.193640786 Residuals Full
    ## 2207 -0.4299204333  -2.650040880 Residuals Full
    ## 2208 -0.7729465895  -4.533473103 Residuals Full
    ## 2209 -0.3442825544  -2.115771857 Residuals Full
    ## 2210  1.6842355767  11.415790753 Residuals Full
    ## 2211 -0.6698800280  -3.957184798 Residuals Full
    ## 2212 -0.8422502582  -4.999468639 Residuals Full
    ## 2213  0.9158572260   5.770963497 Residuals Full
    ## 2214  0.6120677137   4.125409719 Residuals Full
    ## 2215  0.4954178966   3.334009886 Residuals Full
    ## 2216  0.7185506323   4.721252780 Residuals Full
    ## 2217 -0.2459109416  -1.616552880 Residuals Full
    ## 2218  0.0566648099   0.353335072 Residuals Full
    ## 2219 -0.8132411474  -4.773227783 Residuals Full
    ## 2220  0.0331041300   0.165470690 Residuals Full
    ## 2221  1.6781907900  11.397845471 Residuals Full
    ## 2222 -0.3867468049  -2.356929680 Residuals Full
    ## 2223  0.8071137708   5.199470707 Residuals Full
    ## 2224 -0.1573106846  -0.886452419 Residuals Full
    ## 2225 -1.5785617248 -10.941912623 Residuals Full
    ## 2226  0.0169176058   0.056152162 Residuals Full
    ## 2227 -1.9920870977 -13.860092616 Residuals Full
    ## 2228 -1.2389187562  -8.258815974 Residuals Full
    ## 2229  0.0286889416   0.146236114 Residuals Full
    ## 2230  1.2389187562   7.860685726 Residuals Full
    ## 2231  1.1837744786   7.576665194 Residuals Full
    ## 2232 -0.3132272969  -1.954767034 Residuals Full
    ## 2233 -0.8297323252  -4.885909570 Residuals Full
    ## 2234  1.6662819154  11.173249664 Residuals Full
    ## 2235  1.5785617248  10.364153765 Residuals Full
    ## 2236  1.6046626077  10.579301426 Residuals Full
    ## 2237  1.4533494264   9.478698481 Residuals Full
    ## 2238  0.2474274082   1.689828124 Residuals Full
    ## 2239 -0.5121185037  -3.060994126 Residuals Full
    ## 2240 -0.4838094233  -2.931531264 Residuals Full
    ## 2241  0.2993521583   2.034054019 Residuals Full
    ## 2242 -0.3380458469  -2.069077536 Residuals Full
    ## 2243 -0.0655074774  -0.398782298 Residuals Full
    ## 2244 -0.9522653197  -5.926398655 Residuals Full
    ## 2245 -0.6299063340  -3.706910053 Residuals Full
    ## 2246  2.1868172381  15.541668702 Residuals Full
    ## 2247  0.7929329281   5.136882789 Residuals Full
    ## 2248 -0.9639043222  -6.037635075 Residuals Full
    ## 2249 -0.7033983866  -4.108078665 Residuals Full
    ## 2250 -0.7571772767  -4.476105989 Residuals Full
    ## 2251 -0.6227471332  -3.683110521 Residuals Full
    ## 2252  0.5238942236   3.462174153 Residuals Full
    ## 2253  0.2081729909   1.409794530 Residuals Full
    ## 2254  0.2840025184   1.888990130 Residuals Full
    ## 2255  1.8606513573  13.011833344 Residuals Full
    ## 2256 -0.7789097776  -4.556144926 Residuals Full
    ## 2257 -1.0366851197  -6.579283243 Residuals Full
    ## 2258 -0.5442526790  -3.263642858 Residuals Full
    ## 2259  1.3810827425   9.101592789 Residuals Full
    ## 2260 -0.0022065408  -0.038087022 Residuals Full
    ## 2261 -0.3318222607  -2.052331090 Residuals Full
    ## 2262  0.4058413761   2.725905538 Residuals Full
    ## 2263 -2.4703616295 -20.296228055 Residuals Full
    ## 2264 -1.0857668422  -6.950065317 Residuals Full
    ## 2265 -1.3049748599  -8.870640278 Residuals Full
    ## 2266  0.5272720298   3.472707207 Residuals Full
    ## 2267  0.5087670857   3.404965240 Residuals Full
    ## 2268  1.3366465759   8.690529683 Residuals Full
    ## 2269  1.0570408209   6.863327400 Residuals Full
    ## 2270 -0.2947400209  -1.875436356 Residuals Full
    ## 2271  1.5015399476   9.827623054 Residuals Full
    ## 2272 -0.2202143447  -1.407349567 Residuals Full
    ## 2273 -0.5104420780  -3.042637500 Residuals Full
    ## 2274 -0.0272173407  -0.211458005 Residuals Full
    ## 2275  2.3384059923  15.970286884 Residuals Full
    ## 2276  1.7283796147  11.753653741 Residuals Full
    ## 2277 -1.0884229125  -6.989871058 Residuals Full
    ## 2278 -1.8775262037 -13.081197977 Residuals Full
    ## 2279 -0.9158572260  -5.612256059 Residuals Full
    ## 2280  1.5734687073  10.352322210 Residuals Full
    ## 2281 -0.7650381525  -4.490764591 Residuals Full
    ## 2282 -0.0051486137  -0.054431360 Residuals Full
    ## 2283 -0.7281050287  -4.279172903 Residuals Full
    ## 2284 -2.2031786480 -16.145215899 Residuals Full
    ## 2285  0.6588742448   4.400305396 Residuals Full
    ## 2286 -0.5909148660  -3.557387147 Residuals Full
    ## 2287  0.3930956643   2.640194401 Residuals Full
    ## 2288  0.1513560770   1.010132639 Residuals Full
    ## 2289  1.0341707665   6.703715933 Residuals Full
    ## 2290 -0.2141897858  -1.384980954 Residuals Full
    ## 2291 -1.4004287138  -9.721871020 Residuals Full
    ## 2292 -1.0093779124  -6.384511841 Residuals Full
    ## 2293  0.1826827540   1.231795018 Residuals Full
    ## 2294  0.8827943054   5.567403279 Residuals Full
    ## 2295 -1.5634033765 -10.871249837 Residuals Full
    ## 2296 -0.1439203319  -0.818700424 Residuals Full
    ## 2297  0.6479476974   4.311362717 Residuals Full
    ## 2298 -0.3008909487  -1.906912805 Residuals Full
    ## 2299  2.0732874076  14.737914819 Residuals Full
    ## 2300  1.3659700731   8.930520882 Residuals Full
    ## 2301 -0.0935464073  -0.576700059 Residuals Full
    ## 2302  1.2326054444   7.851188972 Residuals Full
    ## 2303 -1.2108863438  -8.079255403 Residuals Full
    ## 2304  1.1778666679   7.568563668 Residuals Full
    ## 2305  1.2614142846   7.983702298 Residuals Full
    ## 2306  0.8915156823   5.582279292 Residuals Full
    ## 2307  1.8054174044  12.296857136 Residuals Full
    ## 2308 -0.7300238818  -4.281281212 Residuals Full
    ## 2309  0.6680401230   4.435547625 Residuals Full
    ## 2310  1.2778818749   8.079113582 Residuals Full
    ## 2311  0.5188386837   3.437525768 Residuals Full
    ## 2312  2.8697487123  19.508412003 Residuals Full
    ## 2313 -0.9851904790  -6.268105128 Residuals Full
    ## 2314  0.8443494187   5.340267573 Residuals Full
    ## 2315  0.4444875324   2.987552692 Residuals Full
    ## 2316  0.7415940439   4.848893645 Residuals Full
    ## 2317  0.0360479422   0.208082654 Residuals Full
    ## 2318  0.2368238770   1.606885174 Residuals Full
    ## 2319 -0.0773057941  -0.497401025 Residuals Full
    ## 2320  0.6921394406   4.540421711 Residuals Full
    ## 2321  1.4836160909   9.651792092 Residuals Full
    ## 2322  1.7483753059  11.958549124 Residuals Full
    ## 2323  0.6809675576   4.508412895 Residuals Full
    ## 2324 -0.5306558627  -3.182845536 Residuals Full
    ## 2325 -0.2748249817  -1.741816185 Residuals Full
    ## 2326  0.3489688757   2.386037330 Residuals Full
    ## 2327  0.8318095865   5.301737103 Residuals Full
    ## 2328  0.6497633899   4.342533751 Residuals Full
    ## 2329 -0.6958826120  -4.061030429 Residuals Full
    ## 2330  0.9499529694   6.117808315 Residuals Full
    ## 2331 -1.5246459980 -10.710657570 Residuals Full
    ## 2332  1.1897238972   7.627284468 Residuals Full
    ## 2333 -1.4925180831 -10.373481219 Residuals Full
    ## 2334 -1.9510059497 -13.457664726 Residuals Full
    ## 2335  0.7650381525   5.000315319 Residuals Full
    ## 2336 -1.4491329081 -10.087220063 Residuals Full
    ## 2337 -1.1432512908  -7.458397187 Residuals Full
    ## 2338 -0.2247380030  -1.439887964 Residuals Full
    ## 2339 -0.2262469071  -1.454037017 Residuals Full
    ## 2340  1.0167501531   6.595779883 Residuals Full
    ## 2341 -0.1053730346  -0.622981010 Residuals Full
    ## 2342 -0.3209616722  -1.994435167 Residuals Full
    ## 2343  0.3442825544   2.345474916 Residuals Full
    ## 2344  0.2504620530   1.713581453 Residuals Full
    ## 2345 -0.4218670446  -2.601701606 Residuals Full
    ## 2346  0.1498682715   0.997259699 Residuals Full
    ## 2347  0.1246235340   0.856069392 Residuals Full
    ## 2348  1.4618608590   9.539338316 Residuals Full
    ## 2349 -0.8443494187  -5.032457899 Residuals Full
    ## 2350 -0.4202596616  -2.560916019 Residuals Full
    ## 2351 -1.3259412597  -9.075826523 Residuals Full
    ## 2352  0.4363832558   2.958191941 Residuals Full
    ## 2353  0.9733103881   6.270753394 Residuals Full
    ## 2354 -0.5752224743  -3.447244616 Residuals Full
    ## 2355  1.6208633506  10.646009387 Residuals Full
    ## 2356  1.2879310866   8.123443975 Residuals Full
    ## 2357 -1.0167501531  -6.412445422 Residuals Full
    ## 2358 -0.0110329187  -0.074165695 Residuals Full
    ## 2359  0.0655074774   0.398891187 Residuals Full
    ## 2360 -0.0861615091  -0.534466205 Residuals Full
    ## 2361  1.4043613713   9.183853667 Residuals Full
    ## 2362  0.5323500580   3.504416942 Residuals Full
    ## 2363 -1.2017507969  -7.971788497 Residuals Full
    ## 2364  0.0022065408  -0.005934369 Residuals Full
    ## 2365  0.4624211394   3.117440264 Residuals Full
    ## 2366 -0.5408441289  -3.236102539 Residuals Full
    ## 2367  0.6625339132   4.420721815 Residuals Full
    ## 2368 -0.1961617467  -1.195292692 Residuals Full
    ## 2369 -0.4706218546  -2.876087112 Residuals Full
    ## 2370  0.7909201136   5.131209652 Residuals Full
    ## 2371 -1.5153063709 -10.639859331 Residuals Full
    ## 2372 -0.0242743124  -0.182925198 Residuals Full
    ## 2373  1.2845669275   8.081254112 Residuals Full
    ## 2374  0.8549015837   5.409225258 Residuals Full
    ## 2375 -0.3835782275  -2.334290157 Residuals Full
    ## 2376 -1.1632741016  -7.566125015 Residuals Full
    ## 2377 -1.3438694382  -9.234757056 Residuals Full
    ## 2378  0.3116826825   2.078442993 Residuals Full
    ## 2379 -0.3646461149  -2.234308432 Residuals Full
    ## 2380 -0.4656976637  -2.848413320 Residuals Full
    ## 2381  1.0831184097   7.014534843 Residuals Full
    ## 2382 -0.0331041300  -0.236779710 Residuals Full
    ## 2383  0.4477374050   3.018605210 Residuals Full
    ## 2384  1.3548370370   8.846197312 Residuals Full
    ## 2385  0.3709419740   2.539748452 Residuals Full
    ## 2386  1.1181623699   7.195047380 Residuals Full
    ## 2387 -1.5940917210 -11.040391545 Residuals Full
    ## 2388  0.6281135191   4.220742818 Residuals Full
    ## 2389  1.3153857813   8.469301555 Residuals Full
    ## 2390 -0.4347658512  -2.668166091 Residuals Full
    ## 2391 -0.2671947102  -1.696422186 Residuals Full
    ## 2392  0.0581382615   0.354927741 Residuals Full
    ## 2393 -1.2516957449  -8.397076677 Residuals Full
    ## 2394  1.1432512908   7.294226729 Residuals Full
    ## 2395 -0.0522451804  -0.356182596 Residuals Full
    ## 2396  1.0392060439   6.741788171 Residuals Full
    ## 2397 -0.1024150604  -0.596641906 Residuals Full
    ## 2398 -0.3287152956  -2.030136739 Residuals Full
    ## 2399  0.5769590244   3.907430930 Residuals Full
    ## 2400 -1.1749281205  -7.632704397 Residuals Full
    ## 2401 -0.9828033651  -6.261279270 Residuals Full
    ## 2402 -0.5020813071  -3.003813428 Residuals Full
    ## 2403  0.8591491821   5.423670654 Residuals Full
    ## 2404  1.2420940112   7.874022025 Residuals Full
    ## 2405 -0.9047264430  -5.340420988 Residuals Full
    ## 2406  1.8362915151  12.510292746 Residuals Full
    ## 2407 -1.3622402863  -9.437823534 Residuals Full
    ## 2408  0.2172010798   1.477857239 Residuals Full
    ## 2409 -0.1946623645  -1.183965340 Residuals Full
    ## 2410  0.4266957603   2.928156145 Residuals Full
    ## 2411  1.7027491454  11.563973334 Residuals Full
    ## 2412  1.1348088937   7.250578746 Residuals Full
    ## 2413  1.3887588134   9.105792969 Residuals Full
    ## 2414 -0.1931634198  -1.183642527 Residuals Full
    ## 2415 -0.2111804327  -1.374403394 Residuals Full
    ## 2416 -1.5684161798 -10.881651894 Residuals Full
    ## 2417  0.7611018357   4.942224475 Residuals Full
    ## 2418 -0.0714053933  -0.449194519 Residuals Full
    ## 2419  1.4491329081   9.462690887 Residuals Full
    ## 2420  0.7300238818   4.779966393 Residuals Full
    ## 2421  0.1142525967   0.780990188 Residuals Full
    ## 2422 -1.7090520170 -11.611267640 Residuals Full
    ## 2423 -0.8401548026  -4.991957681 Residuals Full
    ## 2424 -3.4376182301 -28.910756497 Residuals Full
    ## 2425 -0.5545165943  -3.300909719 Residuals Full
    ## 2426 -0.2051674309  -1.254781405 Residuals Full
    ## 2427  1.1661727667   7.402894166 Residuals Full
    ## 2428 -1.4618608590 -10.159652377 Residuals Full
    ## 2429  0.5909148660   3.963360436 Residuals Full
    ## 2430 -0.2763529437  -1.792424648 Residuals Full
    ## 2431 -0.4234755183  -2.610901325 Residuals Full
    ## 2432 -2.2753102675 -17.595235177 Residuals Full
    ## 2433 -0.0360479422  -0.281302417 Residuals Full
    ## 2434  0.8981014700   5.645527971 Residuals Full
    ## 2435  0.6607029729   4.407007056 Residuals Full
    ## 2436 -0.4331495831  -2.661370286 Residuals Full
    ## 2437  0.8849683368   5.568133082 Residuals Full
    ## 2438  0.4428643570   2.983508084 Residuals Full
    ## 2439  0.1602900682   1.073055691 Residuals Full
    ## 2440  1.4243584932   9.304736881 Residuals Full
    ## 2441 -0.5154756838  -3.088603436 Residuals Full
    ## 2442  0.2565382990   1.728217307 Residuals Full
    ## 2443 -0.2855344152  -1.835687255 Residuals Full
    ## 2444 -1.0831184097  -6.941552193 Residuals Full
    ## 2445  0.1098117334   0.750464861 Residuals Full
    ## 2446  0.1886691747   1.277279535 Residuals Full
    ## 2447  0.0935464073   0.616330428 Residuals Full
    ## 2448 -0.4542514060  -2.794340921 Residuals Full
    ## 2449  1.2201240828   7.772715152 Residuals Full
    ## 2450  0.1068523659   0.724034181 Residuals Full
    ## 2451  1.6722067086  11.275926907 Residuals Full
    ## 2452  2.4403912761  16.332779173 Residuals Full
    ## 2453 -0.4106379553  -2.499610442 Residuals Full
    ## 2454  1.1927144598   7.629754646 Residuals Full
    ## 2455 -0.7396588182  -4.342838147 Residuals Full
    ## 2456 -1.3224063850  -9.064450798 Residuals Full
    ## 2457 -0.1424341505  -0.807643240 Residuals Full
    ## 2458 -0.1976615700  -1.203260234 Residuals Full
    ## 2459  1.0544724518   6.837705204 Residuals Full
    ## 2460 -0.3994604084  -2.430944173 Residuals Full
    ## 2461 -0.1142525967  -0.657348073 Residuals Full
    ## 2462  0.8111953055   5.251510555 Residuals Full
    ## 2463  0.9384665588   5.964720802 Residuals Full
    ## 2464 -0.5323500580  -3.190596133 Residuals Full
    ## 2465 -0.7435320508  -4.366658644 Residuals Full
    ## 2466 -0.0448813556  -0.335032130 Residuals Full
    ## 2467 -0.4772052649  -2.894575703 Residuals Full
    ## 2468 -0.3709419740  -2.261448060 Residuals Full
    ## 2469 -0.8152903987  -4.792252338 Residuals Full
    ## 2470 -1.0417335898  -6.601287842 Residuals Full
    ## 2471  0.4887764111   3.318724143 Residuals Full
    ## 2472  0.6461341385   4.303808384 Residuals Full
    ## 2473 -1.3734871961  -9.622010116 Residuals Full
    ## 2474 -0.0419365294  -0.331668567 Residuals Full
    ## 2475 -1.0991248433  -7.045337715 Residuals Full
    ## 2476 -0.8849683368  -5.260842621 Residuals Full
    ## 2477 -0.8676912444  -5.118348859 Residuals Full
    ## 2478  0.8612788035   5.428633315 Residuals Full
    ## 2479 -1.8054174044 -12.410899471 Residuals Full
    ## 2480 -0.3693666400  -2.260138506 Residuals Full
    ## 2481 -1.0519110197  -6.660350559 Residuals Full
    ## 2482  0.3804134964   2.589188594 Residuals Full
    ## 2483  0.7869040643   5.111387892 Residuals Full
    ## 2484 -2.5379549161 -20.682719858 Residuals Full
    ## 2485  0.5856680754   3.953249157 Residuals Full
    ## 2486  0.5562329114   3.746248628 Residuals Full
    ## 2487  0.5340457827   3.547223750 Residuals Full
    ## 2488  0.0965017732   0.633002139 Residuals Full
    ## 2489  0.3287152956   2.255103581 Residuals Full
    ## 2490 -0.3599337015  -2.219316832 Residuals Full
    ## 2491  0.6884059419   4.522812242 Residuals Full
    ## 2492  0.0625593865   0.376221744 Residuals Full
    ## 2493 -0.0478265711  -0.338122429 Residuals Full
    ## 2494 -0.7261888527  -4.273762650 Residuals Full
    ## 2495 -0.3851620328  -2.341057531 Residuals Full
    ## 2496 -0.7204562435  -4.218734185 Residuals Full
    ## 2497 -0.9592331289  -6.005624879 Residuals Full
    ## 2498 -0.9756753888  -6.228033123 Residuals Full
    ## 2499  0.3583646767   2.464716695 Residuals Full
    ## 2500  1.8775262037  13.237648609 Residuals Full
    ## 2501  0.5425476160   3.594943685 Residuals Full
    ## 2502 -0.4673378004  -2.868113659 Residuals Full
    ## 2503  1.8206375440  12.347345048 Residuals Full
    ## 2504  0.0404642542   0.254437958 Residuals Full
    ## 2505  0.4854637540   3.294944584 Residuals Full
    ## 2506 -0.3819953837  -2.311095936 Residuals Full
    ## 2507 -1.0044934121  -6.374766403 Residuals Full
    ## 2508  1.9609690869  13.739740930 Residuals Full
    ## 2509  0.0876381000   0.576050445 Residuals Full
    ## 2510  2.2953405577  15.856017994 Residuals Full
    ## 2511  0.7849007930   5.107056329 Residuals Full
    ## 2512  0.6902714885   4.536669386 Residuals Full
    ## 2513  0.3772525709   2.564236413 Residuals Full
    ## 2514  1.5534939885  10.088870184 Residuals Full
    ## 2515 -0.7338696779  -4.295395216 Residuals Full
    ## 2516  0.0669817347   0.402955350 Residuals Full
    ## 2517 -1.2047848113  -7.988703840 Residuals Full
    ## 2518  0.3994604084   2.675958510 Residuals Full
    ## 2519 -0.8634123382  -5.097211989 Residuals Full
    ## 2520  0.3101388115   2.073152114 Residuals Full
    ## 2521  0.1424341505   0.959618614 Residuals Full
    ## 2522 -1.3153857813  -8.920490300 Residuals Full
    ## 2523  0.8152903987   5.267157517 Residuals Full
    ## 2524 -0.5926674102  -3.575014117 Residuals Full
    ## 2525 -0.1588002002  -0.891593777 Residuals Full
    ## 2526  0.8464523063   5.348968692 Residuals Full
    ## 2527  0.9271026518   5.894586507 Residuals Full
    ## 2528  0.2519802391   1.715372754 Residuals Full
    ## 2529  0.1290722628   0.890748918 Residuals Full
    ## 2530  0.2459109416   1.679886334 Residuals Full
    ## 2531  1.0937582192   7.077897871 Residuals Full
    ## 2532  0.9136220177   5.757979288 Residuals Full
    ## 2533  0.2962766986   1.982457778 Residuals Full
    ## 2534  0.8235219017   5.275594566 Residuals Full
    ## 2535 -1.4325191375  -9.952207278 Residuals Full
    ## 2536 -1.3548370370  -9.261560440 Residuals Full
    ## 2537 -0.8527835594  -5.070478526 Residuals Full
    ## 2538  1.7690955269  12.078042129 Residuals Full
    ## 2539 -0.0846851060  -0.532062734 Residuals Full
    ## 2540  0.2794108083   1.878544221 Residuals Full
    ## 2541  1.4083158692   9.214884119 Residuals Full
    ## 2542 -1.6100159871 -11.130266600 Residuals Full
    ## 2543  0.7709649629   5.033278040 Residuals Full
    ## 2544 -2.3616769353 -19.781910448 Residuals Full
    ## 2545 -1.2981120729  -8.834831793 Residuals Full
    ## 2546  2.6196185544  17.374083269 Residuals Full
    ## 2547  3.1279062330  19.784799741 Residuals Full
    ## 2548  1.1099541620   7.178387869 Residuals Full
    ## 2549 -0.8091528532  -4.739479162 Residuals Full
    ## 2550 -0.6317011757  -3.708435166 Residuals Full
    ## 2551 -0.3302683796  -2.043415345 Residuals Full
    ## 2552 -0.7015157313  -4.106744535 Residuals Full
    ## 2553 -0.1112917762  -0.647406159 Residuals Full
    ## 2554 -1.7154235234 -11.665304127 Residuals Full
    ## 2555 -0.3116826825  -1.952292391 Residuals Full
    ## 2556  0.1112917762   0.755834807 Residuals Full
    ## 2557 -1.3849105777  -9.667316661 Residuals Full
    ## 2558 -1.6903425386 -11.512293979 Residuals Full
    ## 2559  0.3333769433   2.314341631 Residuals Full
    ## 2560 -1.6375010410 -11.291311888 Residuals Full
    ## 2561  1.3697189597   8.947726751 Residuals Full
    ## 2562 -0.8071137708  -4.737866379 Residuals Full
    ## 2563 -0.2006625545  -1.224887534 Residuals Full
    ## 2564  0.5717545641   3.886132564 Residuals Full
    ## 2565 -0.3772525709  -2.295567508 Residuals Full
    ## 2566  0.6754134139   4.470157169 Residuals Full
    ## 2567  0.1053730346   0.710947699 Residuals Full
    ## 2568  0.0375199638   0.212514724 Residuals Full
    ## 2569  0.6846820143   4.510625894 Residuals Full
    ## 2570 -0.2519802391  -1.633102217 Residuals Full
    ## 2571  1.1264466135   7.216302653 Residuals Full
    ## 2572 -0.9113913647  -5.461785345 Residuals Full
    ## 2573  0.5442526790   3.597012347 Residuals Full
    ## 2574  2.2377901695  15.650435095 Residuals Full
    ## 2575  0.2656705350   1.801935754 Residuals Full
    ## 2576 -0.2337992330  -1.484040563 Residuals Full
    ## 2577 -0.6263227208  -3.698900076 Residuals Full
    ## 2578 -1.1404281247  -7.451706816 Residuals Full
    ## 2579 -0.1350078929  -0.762005128 Residuals Full
    ## 2580  0.7474164701   4.891110376 Residuals Full
    ## 2581  1.9412327949  13.670508858 Residuals Full
    ## 2582  0.3209616722   2.161287170 Residuals Full
    ## 2583  0.8570234501   5.412993685 Residuals Full
    ## 2584  2.1266316067  15.289550590 Residuals Full
    ## 2585 -0.9615661028  -6.026688119 Residuals Full
    ## 2586  0.9851904790   6.340168814 Residuals Full
    ## 2587  0.0419365294   0.279393501 Residuals Full
    ## 2588  1.5246459980   9.887197136 Residuals Full
    ## 2589 -0.1364925358  -0.769278212 Residuals Full
    ## 2590  0.3662187154   2.484386358 Residuals Full
    ## 2591  0.1364925358   0.925998355 Residuals Full
    ## 2592 -2.9745410111 -26.387302207 Residuals Full
    ## 2593 -0.8506693538  -5.060939882 Residuals Full
    ## 2594  0.9592331289   6.158809867 Residuals Full
    ## 2595  1.3849105777   9.104926651 Residuals Full
    ## 2596 -0.1558215180  -0.883423223 Residuals Full
    ## 2597 -0.9780458593  -6.235517161 Residuals Full
    ## 2598  0.2901341447   1.926908055 Residuals Full
    ## 2599 -1.8362915151 -12.604148425 Residuals Full
    ## 2600 -0.1379774796  -0.789530543 Residuals Full
    ## 2601  1.0699886599   6.892197151 Residuals Full
    ## 2602  0.8485589438   5.362757392 Residuals Full
    ## 2603  0.6828236083   4.509557815 Residuals Full
    ## 2604 -0.5087670857  -3.034692867 Residuals Full
    ## 2605 -1.3697189597  -9.488537002 Residuals Full
    ## 2606  0.2111804327   1.435241709 Residuals Full
    ## 2607 -0.1647618214  -0.935323070 Residuals Full
    ## 2608 -0.1841787371  -1.096236168 Residuals Full
    ## 2609 -0.2641469768  -1.679960879 Residuals Full
    ## 2610 -0.5289631892  -3.161452600 Residuals Full
    ## 2611  0.7571772767   4.922884195 Residuals Full
    ## 2612 -0.0994579821  -0.587695073 Residuals Full
    ## 2613  0.8050780388   5.193844407 Residuals Full
    ## 2614  1.1489251297   7.326364849 Residuals Full
    ## 2615 -0.0507722015  -0.353567711 Residuals Full
    ## 2616 -1.0804775527  -6.913418683 Residuals Full
    ## 2617 -0.2081729909  -1.332470400 Residuals Full
    ## 2618  0.9545827729   6.142626536 Residuals Full
    ## 2619  1.3475073079   8.776688072 Residuals Full
    ## 2620 -1.4970137844 -10.415408906 Residuals Full
    ## 2621 -0.3458438165  -2.120718257 Residuals Full
    ## 2622  0.8871465590   5.577365028 Residuals Full
    ## 2623  0.1976615700   1.333556416 Residuals Full
    ## 2624  0.1588002002   1.061420984 Residuals Full
    ## 2625 -1.0241780726  -6.537845893 Residuals Full
    ## 2626 -0.8255885039  -4.879096101 Residuals Full
    ## 2627 -0.2901341447  -1.856653418 Residuals Full
    ## 2628  0.5545165943   3.742425448 Residuals Full
    ## 2629  0.8937066372   5.597782436 Residuals Full
    ## 2630 -0.5717545641  -3.433137581 Residuals Full
    ## 2631 -0.0036775732  -0.040369374 Residuals Full
    ## 2632  0.4412423475   2.981285993 Residuals Full
    ## 2633  0.0596118393   0.356317878 Residuals Full
    ## 2634 -0.8741395644  -5.171932787 Residuals Full
    ## 2635  0.6698800280   4.440095737 Residuals Full
    ## 2636  0.6067541434   4.099034712 Residuals Full
    ## 2637  0.4010541160   2.684860817 Residuals Full
    ## 2638 -0.6085234233  -3.626841188 Residuals Full
    ## 2639  1.8524088450  12.846094898 Residuals Full
    ## 2640  0.7147472132   4.715165722 Residuals Full
    ## 2641  0.9361841086   5.962140229 Residuals Full
    ## 2642  1.7761741027  12.114878919 Residuals Full
    ## 2643  1.0142866142   6.587221675 Residuals Full
    ## 2644  0.8214588106   5.272246669 Residuals Full
    ## 2645  1.7979615660  12.194344761 Residuals Full
    ## 2646  0.0537182726   0.330804326 Residuals Full
    ## 2647  0.6791138497   4.493104320 Residuals Full
    ## 2648 -0.2172010798  -1.394968148 Residuals Full
    ## 2649 -0.6138427435  -3.647816594 Residuals Full
    ## 2650  0.3677922221   2.498152159 Residuals Full
    ## 2651  0.7261888527   4.764513187 Residuals Full
    ## 2652 -0.5171564526  -3.096782424 Residuals Full
    ## 2653  0.5222075618   3.456558222 Residuals Full
    ## 2654  1.5888724072  10.452704893 Residuals Full
    ## 2655  0.4673378004   3.131212338 Residuals Full
    ## 2656  0.3867468049   2.598223709 Residuals Full
    ## 2657  0.5926674102   3.966688825 Residuals Full
    ## 2658  0.6245339289   4.195047438 Residuals Full
    ## 2659 -0.5613917360  -3.330219991 Residuals Full
    ## 2660 -2.0029021394 -14.039907497 Residuals Full
    ## 2661 -1.0570408209  -6.777208431 Residuals Full
    ## 2662 -1.9316416134 -13.391429184 Residuals Full
    ## 2663 -1.3402492670  -9.138942400 Residuals Full
    ## 2664 -0.2353112859  -1.490821788 Residuals Full
    ## 2665 -1.5534939885 -10.841238028 Residuals Full
    ## 2666  0.0066196653   0.005212929 Residuals Full
    ## 2667 -0.8806244384  -5.219233554 Residuals Full
    ## 2668 -1.1376140191  -7.449953799 Residuals Full
    ## 2669  0.6299063340   4.235520658 Residuals Full
    ## 2670 -1.8949532799 -13.239048453 Residuals Full
    ## 2671  1.2679600808   8.019137270 Residuals Full
    ## 2672 -1.4661565825 -10.183207259 Residuals Full
    ## 2673 -1.1320126694  -7.447355885 Residuals Full
    ## 2674 -0.5891641348  -3.552339931 Residuals Full
    ## 2675 -1.0699886599  -6.864621251 Residuals Full
    ## 2676 -1.8606513573 -12.906518915 Residuals Full
    ## 2677 -1.2679600808  -8.544616571 Residuals Full
    ## 2678  0.4656976637   3.126480362 Residuals Full
    ## 2679 -0.1886691747  -1.113199695 Residuals Full
    ## 2680  1.1808154216   7.576248039 Residuals Full
    ## 2681 -0.0154463870  -0.132041624 Residuals Full
    ## 2682 -1.7218654404 -11.667678313 Residuals Full
    ## 2683  0.0905918584   0.595620111 Residuals Full
    ## 2684  0.5786973162   3.912930087 Residuals Full
    ## 2685  0.0802569912   0.501552473 Residuals Full
    ## 2686  0.6552233796   4.364243682 Residuals Full
    ## 2687 -1.0937582192  -6.994854694 Residuals Full
    ## 2688 -0.7829006666  -4.583998966 Residuals Full
    ## 2689  0.5289631892   3.486687177 Residuals Full
    ## 2690 -0.6173986216  -3.654773570 Residuals Full
    ## 2691 -0.7185506323  -4.215954370 Residuals Full
    ## 2692  0.4706218546   3.180729224 Residuals Full
    ## 2693 -0.2307767263  -1.476290922 Residuals Full
    ## 2694 -2.6196185544 -20.794148614 Residuals Full
    ## 2695 -0.3536628734  -2.148817327 Residuals Full
    ## 2696  1.4162916183   9.242609112 Residuals Full
    ## 2697  0.5205223843   3.452229307 Residuals Full
    ## 2698  1.2452818388   7.885907423 Residuals Full
    ## 2699  2.3863017759  16.097496930 Residuals Full
    ## 2700 -0.9875832202  -6.276184966 Residuals Full
    ## 2701  1.8949532799  13.291384054 Residuals Full
    ## 2702  0.6717222036   4.468567962 Residuals Full
    ## 2703 -0.6245339289  -3.691518105 Residuals Full
    ## 2704 -1.1867439373  -7.734405600 Residuals Full
    ## 2705  0.4920944406   3.331740509 Residuals Full
    ## 2706  1.2108863438   7.753006980 Residuals Full
    ## 2707 -0.9293658287  -5.764564412 Residuals Full
    ## 2708 -0.1796920103  -1.073723773 Residuals Full
    ## 2709  0.1172144192   0.784519355 Residuals Full
    ## 2710  0.7166476269   4.719469052 Residuals Full
    ## 2711 -1.1690812635  -7.578705366 Residuals Full
    ## 2712 -0.6846820143  -3.998720408 Residuals Full
    ## 2713 -1.0910866835  -6.992860858 Residuals Full
    ## 2714  0.3835782275   2.594304234 Residuals Full
    ## 2715  0.0316323331   0.163188079 Residuals Full
    ## 2716  1.3402492670   8.695568726 Residuals Full
    ## 2717  0.2824712877   1.888734258 Residuals Full
    ## 2718  1.4970137844   9.789319003 Residuals Full
    ## 2719  0.8132411474   5.263222473 Residuals Full
    ## 2720 -0.3552292675  -2.192284023 Residuals Full
    ## 2721  1.0093779124   6.567178378 Residuals Full
    ## 2722 -1.2452818388  -8.302599250 Residuals Full
    ## 2723 -0.0965017732  -0.580466069 Residuals Full
    ## 2724  0.0787813069   0.459463325 Residuals Full
    ## 2725 -0.4154440008  -2.530395515 Residuals Full
    ## 2726  0.3536628734   2.419703824 Residuals Full
    ## 2727  0.8338904433   5.305497294 Residuals Full
    ## 2728  0.1201772702   0.796382379 Residuals Full
    ## 2729 -1.5584295536 -10.853718564 Residuals Full
    ## 2730  0.4607847392   3.116892838 Residuals Full
    ## 2731 -2.1409633303 -15.387355304 Residuals Full
    ## 2732 -0.2534990061  -1.636450345 Residuals Full
    ## 2733  1.3772750370   9.086832705 Residuals Full
    ## 2734  0.7204562435   4.729766195 Residuals Full
    ## 2735  0.4640587788   3.119018281 Residuals Full
    ## 2736  0.1038939339   0.686104553 Residuals Full
    ## 2737 -1.1719996838  -7.611955282 Residuals Full
    ## 2738  1.3585293543   8.885138890 Residuals Full
    ## 2739  0.3630744157   2.478581714 Residuals Full
    ## 2740  0.3978677147   2.672608193 Residuals Full
    ## 2741 -0.2656705350  -1.684486614 Residuals Full
    ## 2742  0.3915069734   2.637575629 Residuals Full
    ## 2743 -1.4043613713  -9.737472634 Residuals Full
    ## 2744  0.4283075401   2.930232406 Residuals Full
    ## 2745 -0.8937066372  -5.313790985 Residuals Full
    ## 2746  0.6209623234   4.181635898 Residuals Full
    ## 2747 -0.0640333624  -0.395934437 Residuals Full
    ## 2748 -0.9499529694  -5.905688791 Residuals Full
    ## 2749 -0.0095618146  -0.073370088 Residuals Full
    ## 2750 -1.0673847719  -6.837285209 Residuals Full
    ## 2751 -0.2778815512  -1.797619758 Residuals Full
    ## 2752  0.1632708753   1.080288379 Residuals Full
    ## 2753  0.6085234233   4.111382241 Residuals Full
    ## 2754 -0.4380018029  -2.723341185 Residuals Full
    ## 2755 -0.5769590244  -3.496477552 Residuals Full
    ## 2756 -0.6156197095  -3.653279764 Residuals Full
    ## 2757  0.2580588329   1.745068353 Residuals Full
    ## 2758 -0.1038939339  -0.596900928 Residuals Full
    ## 2759 -0.2595799635  -1.662038475 Residuals Full
    ## 2760  0.2202143447   1.491472851 Residuals Full
    ## 2761 -0.8959018906  -5.329808684 Residuals Full
    ## 2762  0.0242743124   0.116712870 Residuals Full
    ## 2763 -0.2840025184  -1.832434712 Residuals Full
    ## 2764 -0.9407539085  -5.843550487 Residuals Full
    ## 2765  0.6515812270   4.345639787 Residuals Full
    ## 2766 -2.4124647297 -20.189133455 Residuals Full
    ## 2767 -0.8318095865  -4.914304511 Residuals Full
    ## 2768 -0.8915156823  -5.283544296 Residuals Full
    ## 2769  1.0020601270   6.459297012 Residuals Full
    ## 2770 -0.7090613843  -4.127108454 Residuals Full
    ## 2771  0.2702449274   1.828029654 Residuals Full
    ## 2772  0.3178656436   2.151373945 Residuals Full
    ## 2773 -0.6014576494  -3.598288083 Residuals Full
    ## 2774 -0.2474274082  -1.618928828 Residuals Full
    ## 2775 -0.6209623234  -3.677164964 Residuals Full
    ## 2776 -1.8129749776 -12.421220809 Residuals Full
    ## 2777  0.0773057941   0.459332463 Residuals Full
    ## 2778  0.5408441289   3.588867532 Residuals Full
    ## 2779  0.1350078929   0.921585720 Residuals Full
    ## 2780  0.8173430796   5.269052687 Residuals Full
    ## 2781 -1.7979615660 -12.284648005 Residuals Full
    ## 2782  0.7242753395   4.759191356 Residuals Full
    ## 2783  0.4970816766   3.334072127 Residuals Full
    ## 2784 -1.1045233111  -7.123243153 Residuals Full
    ## 2785 -1.6208633506 -11.192536225 Residuals Full
    ## 2786  1.0884229125   7.025567157 Residuals Full
    ## 2787 -1.5437348411 -10.805746928 Residuals Full
    ## 2788 -0.7749312560  -4.544692504 Residuals Full
    ## 2789 -0.2702449274  -1.706349012 Residuals Full
    ## 2790 -0.0389920668  -0.316693121 Residuals Full
    ## 2791  1.1126819033   7.178567339 Residuals Full
    ## 2792 -1.0142866142  -6.410269555 Residuals Full
    ## 2793 -0.3583646767  -2.217795080 Residuals Full
    ## 2794 -1.6604150432 -11.337835974 Residuals Full
    ## 2795  1.1632741016   7.402197748 Residuals Full
    ## 2796  2.5027302423  16.475797072 Residuals Full
    ## 2797  1.4366354815   9.416357793 Residuals Full
    ## 2798  1.6546047723  10.997614876 Residuals Full
    ## 2799  0.7769189796   5.055921162 Residuals Full
    ## 2800  0.1216590898   0.810883463 Residuals Full
    ## 2801  0.0478265711   0.298647535 Residuals Full
    ## 2802  1.4792088423   9.609893637 Residuals Full
    ## 2803 -0.2021637230  -1.240072523 Residuals Full
    ## 2804  0.0139752017   0.037270056 Residuals Full
    ## 2805  0.3693666400   2.511101933 Residuals Full
    ## 2806 -0.3333769433  -2.060738733 Residuals Full
    ## 2807 -0.0316323331  -0.231890477 Residuals Full
    ## 2808  1.5060970823   9.828083148 Residuals Full
    ## 2809 -0.7849007930  -4.617478942 Residuals Full
    ## 2810  0.1752088979   1.181924597 Residuals Full
    ## 2811  0.0891148820   0.580673789 Residuals Full
    ## 2812 -0.2717709776  -1.715949244 Residuals Full
    ## 2813  0.0051486137  -0.001763320 Residuals Full
    ## 2814 -0.1513560770  -0.859434573 Residuals Full
    ## 2815  1.5293661104   9.908690009 Residuals Full
    ## 2816 -0.4788543430  -2.903791729 Residuals Full
    ## 2817  1.1867439373   7.588138439 Residuals Full
    ## 2818 -0.1261061652  -0.710197162 Residuals Full
    ## 2819 -1.2879310866  -8.735467082 Residuals Full
    ## 2820 -2.1557487871 -15.728933965 Residuals Full
    ## 2821  0.2141897858   1.451828214 Residuals Full
    ## 2822 -1.6842355767 -11.378018284 Residuals Full
    ## 2823 -2.0252629033 -14.131453777 Residuals Full
    ## 2824 -0.2550183581  -1.637862771 Residuals Full
    ## 2825 -1.2170332922  -8.142915463 Residuals Full
    ## 2826  0.3380458469   2.326445550 Residuals Full
    ## 2827  0.3008909487   2.040990103 Residuals Full
    ## 2828  0.0551914813   0.349880148 Residuals Full
    ## 2829 -1.3015358040  -8.854405373 Residuals Full
    ## 2830  0.5476675641   3.654919626 Residuals Full
    ## 2831  1.7090520170  11.622703520 Residuals Full
    ## 2832  2.4703616295  16.410328561 Residuals Full
    ## 2833  0.2443950403   1.679766341 Residuals Full
    ## 2834 -0.8871465590  -5.263066340 Residuals Full
    ## 2835 -0.2794108083  -1.803905318 Residuals Full
    ## 2836 -0.4493641142  -2.774398648 Residuals Full
    ## 2837  1.3622402863   8.915403781 Residuals Full
    ## 2838 -0.1498682715  -0.840132399 Residuals Full
    ## 2839 -0.1602900682  -0.907027312 Residuals Full
    ## 2840 -0.2292662650  -1.472982959 Residuals Full
    ## 2841  1.9038871529  13.548195296 Residuals Full
    ## 2842  0.6014576494   4.011809864 Residuals Full
    ## 2843 -1.4704795330 -10.194392481 Residuals Full
    ## 2844 -0.9180970195  -5.627246225 Residuals Full
    ## 2845 -0.4396214981  -2.723703838 Residuals Full
    ## 2846 -1.7283796147 -11.703301608 Residuals Full
    ## 2847  0.3819953837   2.593253048 Residuals Full
    ## 2848 -0.0979797706  -0.583872372 Residuals Full
    ## 2849  2.4124647297  16.127864039 Residuals Full
    ## 2850  0.0640333624   0.382693890 Residuals Full
    ## 2851  0.6534012199   4.364203086 Residuals Full
    ## 2852  0.9293658287   5.905006541 Residuals Full
    ## 2853 -1.6319048579 -11.290080289 Residuals Full
    ## 2854  0.6940098108   4.542830207 Residuals Full
    ## 2855 -0.7969682285  -4.675221038 Residuals Full
    ## 2856 -1.4366354815  -9.956470838 Residuals Full
    ## 2857  0.0861615091   0.558215462 Residuals Full
    ## 2858  0.0920690324   0.597222421 Residuals Full
    ## 2859 -1.4284269244  -9.948492302 Residuals Full
    ## 2860 -1.2201240828  -8.146149632 Residuals Full
    ## 2861  1.0266666360   6.620840876 Residuals Full
    ## 2862  0.1543326968   1.042945979 Residuals Full
    ## 2863 -0.4526211086  -2.790243022 Residuals Full
    ## 2864  0.0758304496   0.456524185 Residuals Full
    ## 2865 -1.3585293543  -9.392641207 Residuals Full
    ## 2866  0.4218670446   2.890463554 Residuals Full
    ## 2867  0.2855344152   1.891504840 Residuals Full
    ## 2868  1.7551985485  11.961904218 Residuals Full
    ## 2869  0.0950239865   0.623014859 Residuals Full
    ## 2870  0.2187074641   1.491134951 Residuals Full
    ## 2871 -0.7769189796  -4.552146187 Residuals Full
    ## 2872  0.4202596616   2.877859850 Residuals Full
    ## 2873  0.4509920134   3.069934305 Residuals Full
    ## 2874 -0.5272720298  -3.160678903 Residuals Full
    ## 2875 -0.6067541434  -3.619726534 Residuals Full
    ## 2876 -0.4170481453  -2.542443008 Residuals Full
    ## 2877  1.1376140191   7.264441615 Residuals Full
    ## 2878  0.5961779745   3.970601991 Residuals Full
    ## 2879  0.4106379553   2.782465600 Residuals Full
    ## 2880  0.9780458593   6.290117933 Residuals Full
    ## 2881 -1.1575059061  -7.557920329 Residuals Full
    ## 2882 -1.3511630985  -9.250163655 Residuals Full
    ## 2883 -0.1201772702  -0.699382506 Residuals Full
    ## 2884 -2.8697487123 -24.981414795 Residuals Full
    ## 2885  0.4904347510   3.324917732 Residuals Full
    ## 2886  0.3427221312   2.345264222 Residuals Full
    ## 2887 -0.2732976610  -1.733389479 Residuals Full
    ## 2888 -0.6352969817  -3.735155566 Residuals Full
    ## 2889  0.0183888611   0.076740045 Residuals Full
    ## 2890  2.6680580303  17.433705547 Residuals Full
    ## 2891  1.2516957449   7.907989860 Residuals Full
    ## 2892  0.5121185037   3.434620928 Residuals Full
    ## 2893 -0.7071711997  -4.124422966 Residuals Full
    ## 2894 -0.4987468338  -3.002443676 Residuals Full
    ## 2895 -0.2217217256  -1.418026653 Residuals Full
    ## 2896  1.4880523469   9.652987722 Residuals Full
    ## 2897  0.5037506373   3.376711024 Residuals Full
    ## 2898 -1.4122925138  -9.848075729 Residuals Full
    ## 2899 -0.7552193656  -4.447696664 Residuals Full
    ## 2900 -1.0316629343  -6.570870400 Residuals Full
    ## 2901 -0.5070935195  -3.034638184 Residuals Full
    ## 2902  1.5584295536  10.150598547 Residuals Full
    ## 2903  1.0804775527   6.984125187 Residuals Full
    ## 2904 -2.0860749877 -15.021515220 Residuals Full
    ## 2905 -0.7377263587  -4.301343116 Residuals Full
    ## 2906  0.7338696779   4.816912501 Residuals Full
    ## 2907  1.1719996838   7.468375536 Residuals Full
    ## 2908 -0.0817328504  -0.521087765 Residuals Full
    ## 2909 -0.5037506373  -3.020101367 Residuals Full
    ## 2910 -0.4575156315  -2.808784427 Residuals Full
    ## 2911 -1.6263593197 -11.244906025 Residuals Full
    ## 2912 -0.3271630041  -2.016672372 Residuals Full
    ## 2913 -1.9412327949 -13.448307051 Residuals Full
    ## 2914  1.7416325040  11.865091042 Residuals Full
    ## 2915 -0.2870669824  -1.836488941 Residuals Full
    ## 2916  0.3163187730   2.129578146 Residuals Full
    ## 2917 -0.0007355131  -0.023692276 Residuals Full
    ## 2918  0.8719860966   5.487485504 Residuals Full
    ## 2919  0.1157333810   0.782144268 Residuals Full
    ## 2920 -1.1987278047  -7.925274755 Residuals Full
    ## 2921  1.6604150432  11.163191510 Residuals Full
    ## 2922 -0.3055116140  -1.927009869 Residuals Full
    ## 2923  0.9804218384   6.320906877 Residuals Full
    ## 2924 -0.4010541160  -2.432043960 Residuals Full
    ## 2925 -0.7670107612  -4.494645387 Residuals Full
    ## 2926 -0.9225904827  -5.662593231 Residuals Full
    ## 2927 -0.2580588329  -1.649712097 Residuals Full
    ## 2928  0.2916687481   1.937575269 Residuals Full
    ## 2929  0.9996327605   6.441727648 Residuals Full
    ## 2930 -1.4203135025  -9.881026748 Residuals Full
    ## 2931 -0.3364887318  -2.067676248 Residuals Full
    ## 2932  0.6662024766   4.430829064 Residuals Full
    ## 2933  0.3318222607   2.277832934 Residuals Full
    ## 2934  0.0699306894   0.432857040 Residuals Full
    ## 2935  1.0044934121   6.513120704 Residuals Full
    ## 2936  0.1573106846   1.047443974 Residuals Full
    ## 2937 -0.0213314944  -0.167020817 Residuals Full
    ## 2938 -0.5255823771  -3.143476044 Residuals Full
    ## 2939  1.2357559435   7.859996635 Residuals Full
    ## 2940 -1.2913098855  -8.816342106 Residuals Full
    ## 2941  0.7630685161   4.990728042 Residuals Full
    ## 2942 -0.3946853480  -2.414042709 Residuals Full
    ## 2943  0.6865427880   4.514587035 Residuals Full
    ## 2944 -0.5700231867  -3.398955669 Residuals Full
    ## 2945 -0.3411625419  -2.087331374 Residuals Full
    ## 2946 -0.3427221312  -2.088118905 Residuals Full
    ## 2947 -0.7630685161  -4.489891791 Residuals Full
    ## 2948 -1.1546361986  -7.551982048 Residuals Full
    ## 2949  1.2484823718   7.894638123 Residuals Full
    ## 2950  1.3118996649   8.428747351 Residuals Full
    ## 2951 -0.0905918584  -0.544773362 Residuals Full
    ## 2952  1.2947034910   8.219114844 Residuals Full
    ## 2953  0.8297323252   5.288944548 Residuals Full
    ## 2954 -1.0442678083  -6.614271215 Residuals Full
    ## 2955 -0.4122389113  -2.503164621 Residuals Full
    ## 2956 -1.4575919434 -10.103416601 Residuals Full
    ## 2957  0.5306558627   3.489299828 Residuals Full
    ## 2958  1.8284085249  12.358641545 Residuals Full
    ## 2959  1.1292252684   7.222387713 Residuals Full
    ## 2960  1.7833428114  12.176162321 Residuals Full
    ## 2961  0.3851620328   2.596545480 Residuals Full
    ## 2962 -0.4755574834  -2.891777162 Residuals Full
    ## 2963  0.1692368717   1.128791577 Residuals Full
    ## 2964 -0.8893289986  -5.278970870 Residuals Full
    ## 2965 -0.1991618380  -1.220280356 Residuals Full
    ## 2966 -0.3101388115  -1.945790435 Residuals Full
    ## 2967 -0.4412423475  -2.727974951 Residuals Full
    ## 2968 -0.2413649180  -1.574972036 Residuals Full
    ## 2969  0.3302683796   2.266011478 Residuals Full
    ## 2970 -0.8784587098  -5.185450745 Residuals Full
    ## 2971  0.1946623645   1.304685349 Residuals Full
    ## 2972  1.0910866835   7.052926848 Residuals Full
    ## 2973  0.7435320508   4.874176582 Residuals Full
    ## 2974  2.9745410111  19.737464635 Residuals Full
    ## 2975 -0.8338904433  -4.956765658 Residuals Full
    ## 2976 -1.6662819154 -11.345999138 Residuals Full
    ## 2977  0.7015157313   4.623691250 Residuals Full
    ## 2978 -0.9003054032  -5.333189624 Residuals Full
    ## 2979  1.8442902952  12.678334463 Residuals Full
    ## 2980 -0.0404642542  -0.325592111 Residuals Full
    ## 2981 -0.6717222036  -3.962175782 Residuals Full
    ## 2982  0.3271630041   2.254415158 Residuals Full
    ## 2983  1.2047848113   7.693982063 Residuals Full
    ## 2984  0.9003054032   5.672248035 Residuals Full
    ## 2985  0.2307767263   1.550845121 Residuals Full
    ## 2986 -0.4283075401  -2.623216410 Residuals Full
    ## 2987 -0.0832088875  -0.527405289 Residuals Full
    ## 2988 -2.2953405577 -17.774483022 Residuals Full
    ## 2989 -1.9038871529 -13.265262025 Residuals Full
    ## 2990 -1.7349679688 -11.850710538 Residuals Full
    ## 2991 -1.2294671324  -8.190634925 Residuals Full
    ## 2992  0.3055116140   2.056276110 Residuals Full
    ## 2993  0.5459593257   3.633083494 Residuals Full
    ## 2994  0.9453434393   6.044775561 Residuals Full
    ## 2995 -1.0118292158  -6.407463838 Residuals Full
    ## 2996 -0.4640587788  -2.843593077 Residuals Full
    ## 2997  0.0610855466   0.356446786 Residuals Full
    ## 2998 -0.1127720629  -0.650455040 Residuals Full
    ## 2999  0.4558829115   3.098178514 Residuals Full
    ## 3000 -0.7109541057  -4.127510900 Residuals Full
    ## 3001 -0.3147726589  -1.973553938 Residuals Full
    ## 3002 -1.1957157276  -7.851308515 Residuals Full
    ## 3003  0.7532643453   4.914742418 Residuals Full
    ## 3004 -1.3926277257  -9.719206674 Residuals Full
    ## 3005  0.0994579821   0.668065415 Residuals Full
    ## 3006 -0.6443227022  -3.782612753 Residuals Full
    ## 3007  0.6958826120   4.568242930 Residuals Full
    ## 3008  1.3330611506   8.579664391 Residuals Full
    ## 3009 -0.0920690324  -0.554523144 Residuals Full
    ## 3010  0.6996355593   4.604634964 Residuals Full
    ## 3011 -0.5944217766  -3.579074494 Residuals Full
    ## 3012  1.0192198782   6.596131006 Residuals Full
    ## 3013 -0.4970816766  -2.977097371 Residuals Full
    ## 3014 -1.0493564707  -6.627702750 Residuals Full
    ## 3015  0.2217217256   1.516995383 Residuals Full
    ## 3016  0.3147726589   2.103856972 Residuals Full
    ## 3017 -0.5357430444  -3.215661114 Residuals Full
    ## 3018 -0.8698366649  -5.128048063 Residuals Full
    ## 3019  1.4004287138   9.158655171 Residuals Full
    ## 3020  0.0522451804   0.327440897 Residuals Full
    ## 3021 -0.5786973162  -3.515877361 Residuals Full
    ## 3022 -0.2916687481  -1.859995803 Residuals Full
    ## 3023  0.8634123382   5.449650134 Residuals Full
    ## 3024  1.2812172440   8.080351124 Residuals Full
    ## 3025 -0.5391422098  -3.231004606 Residuals Full
    ## 3026 -0.6102946102  -3.633445283 Residuals Full
    ## 3027  1.7154235234  11.666162764 Residuals Full
    ## 3028 -1.2778818749  -8.607140975 Residuals Full
    ## 3029  0.7319454266   4.788339990 Residuals Full
    ## 3030  0.5682935164   3.841293081 Residuals Full
    ## 3031 -0.0434088954  -0.334438229 Residuals Full
    ## 3032  0.2383370101   1.626655929 Residuals Full
    ## 3033  0.1781972426   1.194934897 Residuals Full
    ## 3034  0.5996959015   3.999796040 Residuals Full
    ## 3035 -0.3489688757  -2.125636071 Residuals Full
    ## 3036 -0.2322877144  -1.478007109 Residuals Full
    ## 3037 -1.1897238972  -7.739408345 Residuals Full
    ## 3038 -0.1901668286  -1.134766578 Residuals Full
    ## 3039  0.3411625419   2.333212347 Residuals Full
    ## 3040  0.6049867608   4.067388104 Residuals Full
    ## 3041  0.9569053642   6.157444223 Residuals Full
    ## 3042 -1.0752183198  -6.875216947 Residuals Full
    ## 3043  0.9947956122   6.430243686 Residuals Full
    ## 3044 -0.6534012199  -3.879939847 Residuals Full
    ## 3045  0.3085956793   2.063223218 Residuals Full
    ## 3046 -0.1216590898  -0.701697382 Residuals Full
    ## 3047 -0.1098117334  -0.639652328 Residuals Full
    ## 3048  0.8193992101   5.270685021 Residuals Full
    ## 3049 -0.6643670773  -3.950385259 Residuals Full
    ## 3050 -0.5631146629  -3.333826635 Residuals Full
    ## 3051 -1.3810827425  -9.666769924 Residuals Full
    ## 3052 -0.0301606047  -0.224004830 Residuals Full
    ## 3053 -1.4533494264 -10.099113855 Residuals Full
    ## 3054  0.2036653472   1.372895576 Residuals Full
    ## 3055 -0.4887764111  -2.953200599 Residuals Full
    ## 3056 -0.0876381000  -0.535756136 Residuals Full
    ## 3057 -0.7513121999  -4.406910191 Residuals Full
    ## 3058  0.7670107612   5.019419663 Residuals Full
    ## 3059  1.3049748599   8.375867772 Residuals Full
    ## 3060 -0.8485589438  -5.051989615 Residuals Full
    ## 3061  0.3946853480   2.647507538 Residuals Full
    ## 3062  0.0257457987   0.131155225 Residuals Full
    ## 3063 -0.6791138497  -3.984666150 Residuals Full
    ## 3064 -0.5510888478  -3.280138320 Residuals Full
    ## 3065  0.2932040388   1.946362830 Residuals Full
    ## 3066 -0.0728802524  -0.449265982 Residuals Full
    ## 3067  0.5891641348   3.960680568 Residuals Full
    ## 3068  0.3225108391   2.209201244 Residuals Full
    ## 3069 -0.5979360130  -3.590519370 Residuals Full
    ## 3070  0.6227471332   4.187395664 Residuals Full
    ## 3071  0.1767028730   1.190659493 Residuals Full
    ## 3072  0.6032212660   4.057043985 Residuals Full
    ## 3073  1.0241780726   6.604655716 Residuals Full
    ## 3074 -0.1707293042  -0.960370909 Residuals Full
    ## 3075  1.9316416134  13.646533556 Residuals Full
    ## 3076  0.8506693538   5.366567640 Residuals Full
    ## 3077  1.0596161818   6.870719078 Residuals Full
    ## 3078 -0.6515812270  -3.839303029 Residuals Full
    ## 3079 -0.8214588106  -4.866585015 Residuals Full
    ## 3080  0.1127720629   0.775881152 Residuals Full
    ## 3081 -1.5015399476 -10.436185200 Residuals Full
    ## 3082 -0.5874152077  -3.531019514 Residuals Full
    ## 3083  0.1796920103   1.198234324 Residuals Full
    ## 3084 -2.2201520097 -16.646498469 Residuals Full
    ## 3085 -0.3070532816  -1.936114079 Residuals Full
    ## 3086  0.8380630296   5.309182550 Residuals Full
    ## 3087  0.5579508685   3.759962384 Residuals Full
    ## 3088 -1.1460835983  -7.487694108 Residuals Full
    ## 3089  0.0728802524   0.434349936 Residuals Full
    ## 3090  0.4090380510   2.756015950 Residuals Full
    ## 3091  2.5379549161  17.241693168 Residuals Full
    ## 3092 -0.8380630296  -4.967911619 Residuals Full
    ## 3093 -0.3024304519  -1.911840380 Residuals Full
    ## 3094 -1.1348088937  -7.447926716 Residuals Full
    ## 3095 -1.1209152388  -7.327430825 Residuals Full
    ## 3096  0.2006625545   1.343498943 Residuals Full
    ## 3097  2.2201520097  15.647115144 Residuals Full
    ## 3098 -0.6902714885  -4.031470349 Residuals Full
    ## 3099 -0.1856751326  -1.103752097 Residuals Full
    ## 3100 -0.2277563265  -1.461057083 Residuals Full
    ## 3101 -1.6431489813 -11.310383233 Residuals Full
    ## 3102  0.1528442176   1.010754655 Residuals Full
    ## 3103  0.2626240315   1.786508145 Residuals Full
    ## 3104  0.2277563265   1.543732081 Residuals Full
    ## 3105 -2.1868172381 -16.101318615 Residuals Full
    ## 3106  0.2809407191   1.883487486 Residuals Full
    ## 3107 -0.3930956643  -2.403937209 Residuals Full
    ## 3108 -0.1528442176  -0.871155480 Residuals Full
    ## 3109  0.3349324322   2.314367100 Residuals Full
    ## 3110 -0.2187074641  -1.399858673 Residuals Full
    ## 3111 -0.9545827729  -5.988053620 Residuals Full
    ## 3112 -0.7809036674  -4.582391646 Residuals Full
    ## 3113  0.1454068313   0.971227227 Residuals Full
    ## 3114  0.0110329187   0.027523305 Residuals Full
    ## 3115  1.8129749776  12.298016393 Residuals Full
    ## 3116  0.4026488429   2.700906165 Residuals Full
    ## 3117 -0.4138409247  -2.528646840 Residuals Full
    ## 3118 -0.8276586380  -4.883364193 Residuals Full
    ## 3119  0.7749312560   5.045240833 Residuals Full
    ## 3120 -0.7052835382  -4.113793302 Residuals Full
    ## 3121 -0.6977578572  -4.069702104 Residuals Full
    ## 3122  2.2561532875  15.688664247 Residuals Full
    ## 3123 -0.4186533637  -2.549601822 Residuals Full
    ## 3124  0.2687195063   1.821550423 Residuals Full
    ## 3125  1.9222249015  13.579885098 Residuals Full
    ## 3126  0.2428797004   1.659423108 Residuals Full
    ## 3127 -0.0198601562  -0.163421987 Residuals Full
    ## 3128  1.5153063709   9.867559187 Residuals Full
    ## 3129 -0.5238942236  -3.128276817 Residuals Full
    ## 3130  1.1957157276   7.641754157 Residuals Full
    ## 3131  0.5054213724   3.377801372 Residuals Full
    ## 3132  1.1546361986   7.328186488 Residuals Full
    ## 3133  0.0832088875   0.522292737 Residuals Full
    ## 3134  0.5874152077   3.957249554 Residuals Full
    ## 3135  0.6138427435   4.125971822 Residuals Full
    ## 3136  0.1811871796   1.231453882 Residuals Full
    ## 3137  0.2978140763   2.019386267 Residuals Full
    ## 3138  0.4331495831   2.949010989 Residuals Full
    ## 3139  2.0252629033  14.370643801 Residuals Full
    ## 3140 -0.6884059419  -4.027936762 Residuals Full
    ## 3141  0.9522653197   6.118930395 Residuals Full
    ## 3142 -1.4836160909 -10.313119413 Residuals Full
    ## 3143 -1.1236766286  -7.330574610 Residuals Full
    ## 3144 -2.6680580303 -20.996154648 Residuals Full
    ## 3145 -1.3475073079  -9.242191423 Residuals Full
    ## 3146  0.7689863591   5.032594853 Residuals Full
    ## 3147 -0.4821564157  -2.931427698 Residuals Full
    ## 3148 -0.8030456378  -4.702952213 Residuals Full
    ## 3149 -0.9091652374  -5.392308219 Residuals Full
    ## 3150  0.0272173407   0.134453136 Residuals Full
    ## 3151  0.3474059220   2.374242840 Residuals Full
    ## 3152 -0.7532643453  -4.430015714 Residuals Full
    ## 3153  0.9828033651   6.332975280 Residuals Full
    ## 3154 -1.2484823718  -8.363463530 Residuals Full
    ## 3155 -0.8655498104  -5.097460891 Residuals Full
    ## 3156 -0.9203414283  -5.660191728 Residuals Full
    ## 3157  0.5804373583   3.919138579 Residuals Full
    ## 3158  0.7377263587   4.825560547 Residuals Full
    ## 3159 -1.2263408830  -8.167086997 Residuals Full
    ## 3160 -0.0625593865  -0.390964873 Residuals Full
    ## 3161 -0.2932040388  -1.872677531 Residuals Full
    ## 3162 -1.1018200634  -7.069292869 Residuals Full
    ## 3163 -1.7906043561 -12.147800988 Residuals Full
    ## 3164  0.4250850883   2.918476849 Residuals Full
    ## 3165  0.0198601562   0.081951542 Residuals Full
    ## 3166 -1.0544724518  -6.664668574 Residuals Full
    ## 3167 -1.9711307685 -13.661860416 Residuals Full
    ## 3168  0.4542514060   3.091825913 Residuals Full
    ## 3169 -1.0020601270  -6.373886880 Residuals Full
    ## 3170 -0.4444875324  -2.745204896 Residuals Full
    ## 3171  0.3194132752   2.157842803 Residuals Full
    ## 3172  0.8527835594   5.368946078 Residuals Full
    ## 3173  1.2078299568   7.724584803 Residuals Full
    ## 3174  0.0125040467   0.035147003 Residuals Full
    ## 3175 -1.7761741027 -12.056985690 Residuals Full
    ## 3176  0.7809036674   5.101484280 Residuals Full
    ## 3177 -0.7909201136  -4.636543695 Residuals Full
    ## 3178 -0.6809675576  -3.990305887 Residuals Full
    ## 3179  0.1483807977   0.994178540 Residuals Full
    ## 3180 -0.9361841086  -5.827376732 Residuals Full
    ## 3181  1.1154179489   7.183775563 Residuals Full
    ## 3182 -1.1072346544  -7.173650365 Residuals Full
    ## 3183  0.4722657847   3.189987164 Residuals Full
    ## 3184  1.2646804092   8.008458714 Residuals Full
    ## 3185 -2.4403912761 -20.288491514 Residuals Full
    ## 3186 -0.7319454266  -4.288976351 Residuals Full
    ## 3187  0.7729465895   5.043279566 Residuals Full
    ## 3188  1.3294927807   8.557613416 Residuals Full
    ## 3189 -1.2420940112  -8.297392425 Residuals Full
    ## 3190 -0.5004133750  -3.003416591 Residuals Full
    ## 3191  1.0725998230   6.893736257 Residuals Full
    ## 3192  0.3039706723   2.048106175 Residuals Full
    ## 3193 -1.3659700731  -9.463308516 Residuals Full
    ## 3194  1.1749281205   7.536773602 Residuals Full
    ## 3195  0.9899816288   6.405313268 Residuals Full
    ## 3196 -1.6046626077 -11.078828981 Residuals Full
    ## 3197 -1.0291615738  -6.553911209 Residuals Full
    ## 3198 -1.5341205444 -10.759518430 Residuals Full
    ## 3199 -1.5836960207 -10.958718663 Residuals Full
    ## 3200  0.5020813071   3.354884675 Residuals Full
    ## 3201 -0.5459593257  -3.264190353 Residuals Full
    ## 3202 -0.4739109922  -2.890765323 Residuals Full
    ## 3203 -0.8570234501  -5.074032870 Residuals Full
    ## 3204 -0.7989907516  -4.677697589 Residuals Full
    ## 3205  1.2294671324   7.848915954 Residuals Full
    ## 3206  0.3725182290   2.548044497 Residuals Full
    ## 3207 -2.7893319350 -21.372191979 Residuals Full
    ## 3208 -0.3085956793  -1.936215713 Residuals Full
    ## 3209 -0.1871719439  -1.103913352 Residuals Full
    ## 3210  0.8422502582   5.337095141 Residuals Full
    ## 3211  1.3224063850   8.518999484 Residuals Full
    ## 3212  2.1710210996  15.476355869 Residuals Full
    ## 3213  0.3756735225   2.563695161 Residuals Full
    ## 3214 -0.3677922221  -2.252113667 Residuals Full
    ## 3215  0.1677448161   1.114604307 Residuals Full
    ## 3216  0.3505326823   2.386235024 Residuals Full
    ## 3217  1.1320126694   7.236356425 Residuals Full
    ## 3218 -0.5476675641  -3.265348148 Residuals Full
    ## 3219  0.4772052649   3.216272279 Residuals Full
    ## 3220 -1.0725998230  -6.866490651 Residuals Full
    ## 3221 -0.6680401230  -3.956501482 Residuals Full
    ## 3222 -0.9384665588  -5.832263344 Residuals Full
    ## 3223 -0.4805047244  -2.913613863 Residuals Full
    ## 3224  0.4493641142   3.024845825 Residuals Full
    ## 3225  1.4704795330   9.593712308 Residuals Full
    ## 3226  0.2353112859   1.601341652 Residuals Full
    ## 3227 -1.3366465759  -9.093764958 Residuals Full
    ## 3228 -0.1275890737  -0.712892666 Residuals Full
    ## 3229 -0.7889104984  -4.627753303 Residuals Full
    ## 3230 -0.9733103881  -6.218063006 Residuals Full
    ## 3231 -1.1126819033  -7.282615809 Residuals Full
    ## 3232  0.7223644744   4.748684934 Residuals Full
    ## 3233 -0.8549015837  -5.071303603 Residuals Full
    ## 3234 -0.6828236083  -3.992819804 Residuals Full
    ## 3235 -0.9569053642  -5.994803761 Residuals Full
    ## 3236  0.0846851060   0.529689192 Residuals Full
    ## 3237  0.2021637230   1.350794250 Residuals Full
    ## 3238 -0.8719860966  -5.147150581 Residuals Full
    ## 3239 -0.6570477175  -3.897706447 Residuals Full
    ## 3240 -1.3084294195  -8.873210891 Residuals Full
    ## 3241 -0.0345759986  -0.270164241 Residuals Full
    ## 3242 -1.1808154216  -7.643539703 Residuals Full
    ## 3243  0.2232296105   1.535782629 Residuals Full
    ## 3244 -0.2962766986  -1.876569631 Residuals Full
    ## 3245  0.6263227208   4.207960762 Residuals Full
    ## 3246  1.3015358040   8.373185887 Residuals Full
    ## 3247 -2.0732874076 -14.669948120 Residuals Full
    ## 3248 -0.2066699775  -1.269159540 Residuals Full
    ## 3249 -0.8827943054  -5.243962562 Residuals Full
    ## 3250 -0.4904347510  -2.956003552 Residuals Full
    ## 3251 -0.1186957144  -0.688042302 Residuals Full
    ## 3252 -0.7949489602  -4.659185623 Residuals Full
    ## 3253 -0.2978140763  -1.888790796 Residuals Full
    ## 3254  0.4154440008   2.814557889 Residuals Full
    ## 3255 -0.2504620530  -1.631564918 Residuals Full
    ## 3256  1.0216958358   6.602501192 Residuals Full
    ## 3257 -2.0368341317 -14.270635891 Residuals Full
    ## 3258  2.2031786480  15.553419621 Residuals Full
    ## 3259 -0.0566648099  -0.373077016 Residuals Full
    ## 3260  1.4407763132   9.432300255 Residuals Full
    ## 3261 -0.4477374050  -2.774132588 Residuals Full
    ## 3262  0.2671947102   1.809459633 Residuals Full
    ## 3263 -0.9662478233  -6.058612888 Residuals Full
    ## 3264  0.3899192700   2.625091518 Residuals Full
    ## 3265  0.5821791597   3.935481590 Residuals Full
    ## 3266  1.4449419977   9.444857143 Residuals Full
    ## 3267  0.5510888478   3.703424453 Residuals Full
    ## 3268  0.5104420780   3.412491981 Residuals Full
    ## 3269  1.4661565825   9.593217993 Residuals Full
    ## 3270  1.9815001616  13.871795186 Residuals Full
    ## 3271 -0.9923857457  -6.316493652 Residuals Full
    ## 3272  1.5993548248  10.552631229 Residuals Full
    ## 3273  0.1558215180   1.043444047 Residuals Full
    ## 3274  1.2232265734   7.802239205 Residuals Full
    ## 3275  0.8359749171   5.307188419 Residuals Full
    ## 3276 -0.0758304496  -0.479320491 Residuals Full
    ## 3277  0.2126848685   1.447234989 Residuals Full
    ## 3278  1.0621985898   6.875447736 Residuals Full
    ## 3279  0.6570477175   4.371054524 Residuals Full
    ## 3280 -0.3039706723  -1.912343372 Residuals Full
    ## 3281  0.0036775732  -0.002441485 Residuals Full
    ## 3282  0.1737153138   1.179802198 Residuals Full
    ## 3283  0.2247380030   1.536406359 Residuals Full
    ## 3284  0.6735666616   4.470063451 Residuals Full
    ## 3285  0.7033983866   4.629637301 Residuals Full
    ## 3286 -1.9222249015 -13.348539888 Residuals Full
    ## 3287  0.2292662650   1.550172485 Residuals Full
    ## 3288  0.3364887318   2.318388495 Residuals Full
    ## 3289 -0.7166476269  -4.207523731 Residuals Full
    ## 3290 -1.2549220950  -8.435453619 Residuals Full
    ## 3291  0.2778815512   1.874554680 Residuals Full
    ## 3292 -0.1083319310  -0.637321828 Residuals Full
    ## 3293  1.2745606616   8.070725233 Residuals Full
    ## 3294 -0.3883325489  -2.360427082 Residuals Full
    ## 3295 -0.6940098108  -4.060203108 Residuals Full
    ## 3296  1.1987278047   7.684782040 Residuals Full
    ## 3297 -0.5374418509  -3.219578892 Residuals Full
    ## 3298 -1.1181623699  -7.322639092 Residuals Full
    ## 3299  0.2489444440   1.702585545 Residuals Full
    ## 3300 -1.4162916183  -9.854837356 Residuals Full
    ## 3301 -1.1099541620  -7.197349569 Residuals Full
    ## 3302 -2.3863017759 -20.027930382 Residuals Full
    ## 3303  0.3396037821   2.326753091 Residuals Full
    ## 3304 -0.2886002242  -1.847681293 Residuals Full
    ## 3305  1.0991248433   7.113271516 Residuals Full
    ## 3306  0.1009364109   0.678732661 Residuals Full
    ## 3307  1.7621044997  12.006542752 Residuals Full
    ## 3308  2.0992130735  15.113123730 Residuals Full
    ## 3309 -0.0125040467  -0.114278939 Residuals Full
    ## 3310 -0.8050780388  -4.721147988 Residuals Full
    ## 3311  1.4284269244   9.311414641 Residuals Full
    ## 3312 -1.0647881010  -6.822669807 Residuals Full
    ## 3313 -1.1489251297  -7.503173160 Residuals Full
    ## 3314 -2.5766418614 -20.739483242 Residuals Full
    ## 3315  0.6443227022   4.286653392 Residuals Full
    ## 3316  0.5979360130   3.981323055 Residuals Full
    ## 3317 -0.0802569912  -0.519347990 Residuals Full
    ## 3318 -1.7833428114 -12.104265522 Residuals Full
    ## 3319  0.5255823771   3.462968934 Residuals Full
    ## 3320  0.4170481453   2.849350105 Residuals Full
    ## 3321  0.1275890737   0.880513308 Residuals Full
    ## 3322 -0.9339065251  -5.793618623 Residuals Full
    ## 3323 -0.9316337759  -5.768820116 Residuals Full
    ## 3324 -0.1737153138  -0.979281204 Residuals Full
    ## 3325 -1.2812172440  -8.610271996 Residuals Full
    ## 3326  0.0434088954   0.279748499 Residuals Full
    ## 3327  0.9225904827   5.856099484 Residuals Full
    ## 3328 -0.0257457987  -0.197612076 Residuals Full
    ## 3329 -0.7689863591  -4.515559727 Residuals Full
    ## 3330 -0.9996327605  -6.351595417 Residuals Full
    ## 3331 -0.2993521583  -1.903724981 Residuals Full
    ## 3332  0.5596704740   3.767729118 Residuals Full
    ## 3333  0.3599337015   2.469783311 Residuals Full
    ## 3334 -0.1677448161  -0.939176158 Residuals Full
    ## 3335  0.6317011757   4.243126493 Residuals Full
    ## 3336 -0.4591495720  -2.812617470 Residuals Full
    ## 3337  0.3458438165   2.362251437 Residuals Full
    ## 3338 -1.8861681393 -13.133214438 Residuals Full
    ## 3339  0.4299204333   2.941917993 Residuals Full
    ## 3340 -0.1767028730  -1.009223608 Residuals Full
    ## 3341  0.1931634198   1.303666979 Residuals Full
    ## 3342  0.2947400209   1.956409185 Residuals Full
    ## 3343 -3.1279062330 -26.838914800 Residuals Full
    ## 3344  0.2763529437   1.873963905 Residuals Full
    ## 3345 -1.1264466135  -7.364504873 Residuals Full
    ## 3346 -0.0581382615  -0.378745604 Residuals Full
    ## 3347  1.0647881010   6.881651662 Residuals Full
    ## 3348 -2.0608301310 -14.393168985 Residuals Full
    ## 3349 -0.2626240315  -1.674438695 Residuals Full
    ## 3350 -0.3615036128  -2.221741160 Residuals Full
    ## 3351  1.1575059061   7.328857808 Residuals Full
    ## 3352  1.0493564707   6.797297826 Residuals Full
    ## 3353  0.9407539085   5.976991060 Residuals Full
    ## 3354  0.5391422098   3.565664831 Residuals Full
    ## 3355 -0.0463539131  -0.335303222 Residuals Full
    ## 3356 -1.4880523469 -10.356993312 Residuals Full
    ## 3357  1.8690222541  13.219692513 Residuals Full
    ## 3358 -0.1409482835  -0.796970024 Residuals Full
    ## 3359  0.9069436065   5.738674742 Residuals Full
    ## 3360  0.4838094233   3.278669386 Residuals Full
    ## 3361  1.1517759683   7.328116794 Residuals Full
    ## 3362 -2.1127238216 -15.114222197 Residuals Full
    ## 3363 -0.1468936521  -0.824060749 Residuals Full
    ## 3364 -1.8442902952 -12.876173291 Residuals Full
    ## 3365 -1.2646804092  -8.532647911 Residuals Full
    ## 3366  1.3259412597   8.525196697 Residuals Full
    ## 3367 -0.5340457827  -3.205292297 Residuals Full
    ## 3368  0.0743552701   0.445684356 Residuals Full
    ## 3369  0.4122389113   2.796117666 Residuals Full
    ## 3370  0.1916649091   1.296097262 Residuals Full
    ## 3371  0.1439203319   0.959987028 Residuals Full
    ## 3372  0.1841787371   1.251032934 Residuals Full
    ## 3373 -0.6921394406  -4.038965153 Residuals Full
    ## 3374  2.5766418614  17.328513315 Residuals Full
    ## 3375 -1.0069326592  -6.384360053 Residuals Full
    ## 3376 -0.0787813069  -0.508300848 Residuals Full
    ## 3377 -0.9248442136  -5.695227098 Residuals Full
    ## 3378  2.3163364415  15.921635828 Residuals Full
    ## 3379  1.6263593197  10.659780362 Residuals Full
    ## 3380  2.0608301310  14.706405678 Residuals Full
    ## 3381  1.0857668422   7.020089086 Residuals Full
    ## 3382 -0.1231411766  -0.703503212 Residuals Full
    ## 3383 -1.0216958358  -6.470192830 Residuals Full
    ## 3384 -0.6588742448  -3.898368828 Residuals Full
    ## 3385 -2.0992130735 -15.059511790 Residuals Full
    ## 3386 -0.4026488429  -2.433091418 Residuals Full
    ## 3387  0.9430461909   6.025889241 Residuals Full
    ## 3388 -0.6461341385  -3.804736972 Residuals Full
    ## 3389 -0.3474059220  -2.122581763 Residuals Full
    ## 3390 -1.8690222541 -12.978400513 Residuals Full
    ## 3391  0.0714053933   0.433766969 Residuals Full
    ## 3392 -1.0341707665  -6.572561023 Residuals Full
    ## 3393 -0.6032212660  -3.598816157 Residuals Full
    ## 3394 -1.2581615611  -8.440456958 Residuals Full
    ## 3395  0.0979797706   0.642225938 Residuals Full
    ## 3396  1.0673847719   6.887233816 Residuals Full
    ## 3397 -0.0139752017  -0.124763812 Residuals Full
    ## 3398  1.0468087512   6.777709914 Residuals Full
    ## 3399  0.2322877144   1.555617147 Residuals Full
    ## 3400  0.0463539131   0.296506036 Residuals Full
    ## 3401  0.9180970195   5.799721193 Residuals Full
    ## 3402 -1.6965132006 -11.575866911 Residuals Full
    ## 3403  0.4347658512   2.953177898 Residuals Full
    ## 3404 -0.2443950403  -1.613756956 Residuals Full
    ## 3405  0.4074391931   2.753996189 Residuals Full
    ## 3406 -1.2712534480  -8.562480154 Residuals Full
    ## 3407  0.6977578572   4.571471981 Residuals Full
    ## 3408 -0.3240607803  -1.999134579 Residuals Full
