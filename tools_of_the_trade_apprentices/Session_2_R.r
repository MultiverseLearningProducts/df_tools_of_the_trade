x <- 'my variable'

x = 'my variable'

print(x)

x

y <- 2:6
y

typeof(y)

# We can add comments in R the same way we do in Python

'But there are
other methods of doing it too, 
which let you put it over multiple lines
but hashtag is best practice
so please do not use this'

1 + 1

10-15

5 * 6

2 ** 5

10 %% 3 #Modulo

10/5

sqrt(25)

mean(c(3,5,6))

mean(4:6)

median(4:6)

l <- list('a'=1, 'b'=2,'c'=3)
l

l$a

l2 <- list(1,'some text',3, TRUE)
l2

l2[4]

l['a']

l2[[4]]

l[['a']]

l[['d']] <- 'Multiverse'
l

l[['f']] <- 7
l

l$h <- 20

l

l[['a']] <- 20
l

l[['b']] <- NULL; l #The semi-colon allows us to put multiple commands in the same line, though we do not recommend doing this

str(l)

numbers <- c(1,2,3,8)
numbers

str(numbers)

numbers[4]

numbers[c(1,4)] #access several elements

numbers[1]= 5
numbers

numbers[5]=10
numbers

l

more_numbers <- c('first'=1, 'second'=2, 'third'=3)
more_numbers

more_numbers['first']

more_numbers[['first']]

# A:

X <- matrix(nrow=2,ncol=3)
print(X) # An empty matrix

X <- matrix(c(2,3,5,3,4,2),nrow=2,ncol=3)
print(X)

str(X)

X2 <- cbind(X,c(4,5))
print(X2)

X3 <- rbind(X,c(34,2,1))
print(X3)

df <- data.frame(one=c(1:5), two=c('A','B','C','D','E'))
print(df)

df

str(df)

df$one

df['one']

df[['one']]

df <- rbind(df,data.frame(one=6,two='F'))
df

df <- cbind(df,data.frame(three=c(TRUE, FALSE, FALSE, TRUE, TRUE, FALSE)))
df

df$four= c('R','R','Python','Python','Python','R')
df

subset(df,select=-c(two)) # Dataframe output. Needs to be reassigned to df for the value to hold.

# OR the following gives you a vector output
df[,-c(2)]

# OR for a more permanent change...
df$two <- NULL

df[-c(5),]

# A:

# This is Python code; it won't run in R
value = 10
if value > 5:
    print('something')

value <- 10

if (value > 5){
    print('Greater than 5')
}
 

value <- 4

if (value > 5){
    print('Greater than 5')
} else {
    print('Less than or equal to 5')
}

value <- 5

if (value > 10){
    print('Greater than 10')
} else if (value == 5) {
    print('Equals 5')
} else {
    print('Not 5 and less than or equal to 10')
}

value <- 7

if (value > 5 & value < 10){
    print(' Value between 5 and 10')
}

value <- 2

if (value > 5 | value == 2){
    print(' Value is 2 or greater than 5')
}

if (value > 10) {print('value greater than 10')} else {print('value less than 10')}

names <-  c('John','Jack','Andrew','Joseph','Laura','Grace','Rohit','Haydeh')

for (name in names){
    print(paste("Hi", name))
}

for (name in names){
    if (nchar(name)==4){
        print(paste(name, " has 4 letters"))
    } else{
        print(paste(name, "does not have 4 letters"))
    }
}

n <- 20

while (n>0){
    print(paste('Five times ',n,' is ',n*5))
    n <- n-1
}

sqrt_squared_diff <- function(x,y){
    return(sqrt(abs(x**2-y**2)))
}

sqrt_squared_diff(5,2)

# A:

#For the first time

install.packages("tidyverse")

#Every time after
library(tidyverse)

# Loading a data set
data <- read.csv('./data/products.csv')

# Note different import functions exist for different data files

# Check the head
tail(data)

# Check summary statistics
summary(data)

# For one column
summary(data$pack)

# For one statistic
sd(data$pack)

mean(data$pack)

# Correlations
cor(data$proof,data$bottle_size)

# Filter
filter(data,proof>40 )

# More than one filter?
filter(data,proof==40,pack>10)

# Arrange
arrange(data, vendor)

# Change the order
arrange(data, desc(vendor))

# This is a Python example
data[data.bottle_size > 10].sort_values(by='vendor')

# Filter then arrange
arrange(filter(data,bottle_size>10), vendor)

data %>% filter(bottle_size>10) %>% arrange(vendor)

# This can be stored to a variable
d <- data %>% filter(bottle_size>10) %>% arrange(vendor)

data %>% slice(1:5)

data %>% select(category_name,proof) %>% head()

data %>% rename(vendor_no=vendor) 

str(data)

data <- data %>% mutate(case_cost=as.double(case_cost))

str(data)

data %>% mutate(total_cost=pack*case_cost)

data %>% mutate(vendor=vendor+1)

mean(data$bottle_size)

data %>% summarise(mean_bottle_size=mean(bottle_size))

data %>% group_by(category_name) %>% summarise(mean_bottle_size=mean(bottle_size)) %>% head()

gap_data <- read.csv('data/gapminder_data.csv')

head(gap_data)

# A:

# A:

# A:

# A:

# A:

gap_data <- read.csv('./Data/gapminder_data.csv')

# To build a scatter graph we need to state the data source, what our x and y values are and what type of plot we want.
ggplot(data=gap_data,aes(x=lifeExp,y=pop)) + geom_point()

gap_2007 <- gap_data %>% filter(year==2007)

# If I wanted to colour by continent
ggplot(data=gap_2007,aes(x=lifeExp,y=pop,color=continent)) + geom_point()

# To build a bar graph we change to geom_bar. In this example we are calculating the mean lifeExp per continent
ggplot(data=gap_data,aes(x=continent,y=lifeExp)) + geom_bar(stat='summary',fun='mean')

# Boxplots
ggplot(data=gap_data,aes(x=continent,y=lifeExp)) + geom_boxplot()

ggplot(data=gap_data,aes(x=continent,y=lifeExp)) + 
    geom_bar(stat='summary',fun='mean',fill=c('#4d61f4','#242456','green','yellow','orange')) +
    labs(x='Continent',y='Mean Life Expectancy',title='Mean Life Expectancy per Continent') 

ggplot(data=gap_data,aes(x=lifeExp,y=pop,color=continent)) + geom_point() + facet_wrap(vars(continent))

# A:

# A

mymodel <- lm(lifeExp~gdpPercap,data=gap_data)

my_multi_model <- lm(lifeExp~gdpPercap + pop, data=gap_data) # Adding in more than one predictor

summary(mymodel)

summary(my_multi_model)

gap_europe_2007 = gap_2007 %>% mutate(is_europe= ifelse(continent=='Europe',1,0))

gap_europe_2007

logit_model <- glm(is_europe~gdpPercap+lifeExp, data=gap_europe_2007)

summary(logit_model)

gap_data %>% filter(year==1977) %>% group_by(continent) %>% summarise(mean_lifeExp=mean(lifeExp))

gap_data %>% filter(year==2007) %>% group_by(continent) %>% summarise(mean_lifeExp=mean(lifeExp))

gap_asia_2007= gap_data %>% filter(year==2007,continent=='Asia') #subset our data to Asia in 2007

t.test(gap_asia_2007$lifeExp,mu=59.6) 

t.test(gap_asia_2007$lifeExp,mu=59.6,alternative='greater')
