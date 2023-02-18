#!/usr/bin/env nu

const readme = "README.md"
const out = "index.html"

def main [
  message: string = "Updated" # Message for git commit
] {
  compile
  push $message
  print $"(ansi green_bold )Done(ansi reset)"
}

def compile [] {
  marky $readme --out $out
}

def push [message: string] {
  git add -A
  git commit -m $message
  git push
}