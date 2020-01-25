# array of shortest string

strings = ["apples", "pears", "bananas"]
#output would be "pears" as string

current_string = strings[0]

strings.each do |string|
  if current_string.length > string.length
    current_string = string


  end
end

p current_string

# 
# look at second word and count the letters and compare length to the variable of first
# if the second word has less letters, replace the variable with the new word
# continue looking at each word and if longer





