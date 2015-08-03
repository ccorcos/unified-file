
fs = require 'fs'

FILE = 'program'
KEY = '~'
SEP = '.'

startsWith = (key, string) ->
  for i in [0...key.length]
    if key[i] isnt string[i]
      return false
  return true

parse = (string) ->
  sections = []
  current = null
  acc = []
  for line in string.split('\n')
    if startsWith(KEY, line)
      if current isnt null
        sections.push({name:current, text:acc.join('\n')})
        acc = []
      current = line.slice(KEY.length)
    else
      acc.push(line)
  sections.push({name:current, text:acc.join('\n')})
  return sections

nameMatchesTags = (tags, name) ->
  nameTags = name.split(SEP)
  for tag in tags
    if nameTags.indexOf(tag) is -1
      return false
  return true

filterTags = (tags, sections) ->
  sections.filter ({name}) -> nameMatchesTags(tags, name)

compile = (sections, anchors=true) ->
  sections.map(({name, text}) ->
    if anchors
      return KEY + name + '\n' + text
    else
      return text
  ).join('\n')

buildFile = (query, sections, outputFile) ->
  string = compile(filterTags(query.split(SEP), sections), false)
  fs.writeFileSync(outputFile, string)

createTab = (query, sections, outputFile) ->
  string = compile(filterTags(query.split(SEP), sections))
  fs.writeFileSync(outputFile, string)

fileString = fs.readFileSync(FILE, 'utf8')
sections = parse(fileString)

buildFile('html', sections, 'build/program.html')
buildFile('css', sections, 'build/program.css')
buildFile('jsx', sections, 'build/program.jsx')

createTab('counter', sections, 'tabs/counter')
createTab('app', sections, 'tabs/app')
