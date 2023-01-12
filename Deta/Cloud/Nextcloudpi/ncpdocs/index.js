#!/usr/bin/env node
const { Deta } = require('deta')
const express = require('express')
const path = require('path')
const router = express.Router()
const app = express()
const deta = Deta()
const db = deta.Base('ncp_docs')
const topics = deta.Base('topics')
const NCPDOCS = "https://help.nextcloud.com/c/ncpdocs/178.json"
const NCPDOCBASE = "https://help.nextcloud.com/t/"
const NEWTOPICS = "https://help.nextcloud.com/new.json"
const NEWTOPICSPAGE = "https://help.nextcloud.com/new.json?page="
const key = "topics"
const docs_key = "docs"

app.use(express.json())

async function saveDoc(id, document, html) {
  const dbdoc = await db.put({key: id, content: document, html: html})
  return dbdoc
}

async function fetchDoc(id) {
  const jsondoc = await fetch(`https://help.nextcloud.com/t/${id}.json`).then(res => res.json())
  return jsondoc
}

async function getDoc(id) {
  const item = await db.fetch({'key': id})
  return item
}

app.get('/', async (req, res) => {
  res.sendFile(path.join(__dirname+'/index.html'))
})

app.get('/topics', async (req, res) => {
  const topics = await db.fetch()
  const content = topics['items']
  res.send(content)
})

app.get('/t/:id', async (req, res) => {
  const dbdocID = req.params['id']
  const dbDoc = await getDoc(dbdocID)
  const htm = dbDoc['items'][0]['html']
  res.send(htm)
})

//app.get('/fetch/topics', async (req, res) => {
//  const json = await fetch(NCPDOCS).then(res => res.json())
//  const topics = json['topic_list']['topics']
//  const allTopics = []
//  topics.forEach(topic => {
//    let id = topic['id']
//    let title = topic['title']
//    let edited = topic['bumped_at']
//    let obj = {
//      key: id,
//      title: title,
//      edited: edited
//    }
//    allTopics.push(obj)
//  })
//  const saved = await topics.putMany([{key: key, content: allTopics}])
//  res.send(saved)
//})

app.get('/fetch/:doc_id', async (req, res) => {
  doc_id = req.params['doc_id']
  const doc = await fetchDoc(doc_id)
  const title = doc['title']
  const content = doc['post_stream']['posts'][0]['cooked']
  const html = ('<!DOCTYPE html><html lang="en"> \
                   <head> \
                     <meta charset="UTF-8"> \
                     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> \
                     <meta name="viewport" content="width=device-width, initial-scale=1.0"> \
                     <title>'+title+'</title> \
                     <meta name="robots" content="noindex,nofollow"> \
                     <link rel="icon" href="data:,"> \
                     </head><body><h1>' + title + '</h1><br>' + content + '</body></html>')
  const save = await saveDoc(doc_id, doc, html)
  res.send(html)
})

app.get('*', async (req, res) => {
  res.send('Whoops! Something went wrong')
})

module.exports = app
