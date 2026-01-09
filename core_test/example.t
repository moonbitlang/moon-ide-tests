Test moon version command:
  $ moon ide doc 'String::length'
  package "moonbitlang/core/string"
  
  pub fn String::length(String) -> Int
    Returns the number of UTF-16 code units in the string. Note that this is not
     necessarily equal to the number of Unicode characters (code points) in the
     string, as some characters may be represented by multiple UTF-16 code units.
    
     Parameters:
    
     * `string` : The string whose length is to be determined.
    
     Returns the number of UTF-16 code units in the string.
    
     Example:
    
     ```mbt check
     test {
       inspect("hello".length(), content="5")
       inspect("🤣".length(), content="2") // Emoji uses two UTF-16 code units
       inspect("".length(), content="0") // Empty string
     }
     ```
