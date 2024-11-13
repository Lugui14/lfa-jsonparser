# JSON parser

This is an example of using flex and bison to create a simple
parser for [JSON](https://www.json.org/json-en.html).

Note that this is not a complete or correct JSON parser.  The
primary goal is to be a decent example of using flex and bison
together.

## How to run

- This is a fork, so instead of pass a dinamic json in input, you will modify run.json file to be readed<br/>
- You will need [RUBY](https://www.ruby-lang.org/) installed to run... <br/>

```bash
  ./scan_grammar_symbols.rb < parse.y
  
  make

  ./jsonparser
```