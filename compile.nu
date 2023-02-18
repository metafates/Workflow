#!/usr/bin/env nu

const readme = "README.md"
const out = "index.html"

def main [] {
  marky $readme --out $out
}