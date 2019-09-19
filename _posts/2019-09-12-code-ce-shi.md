---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: code测试
date: 2019-09-19 15:44
category: 
---

```ruby
#encoding: utf-8
require 'nokogiri'
require 'open-uri'

#创建document
def getdoc(url)
  Nokogiri::HTML(open(URI::escape(url)))
end

def getele(url, css)
  (Nokogiri::HTML(open(URI::escape(url)))).css(css)
end


10.times do |page|
  url = "http://www.ed2000.com/FileList.asp?PageIndex=#{page+1}&FileCategory=图书&SubCategory=计算机与网络"
  doc = getdoc(url)
  doc.css('table.CommonListArea tr.CommonListCell td a').each do |a|
    url2 = "http://www.ed2000.com#{a['href'] if a['href'].index('/ShowFile')}"
    # puts url2
    getdoc(url2).css('table.CommonListArea tr.CommonListCell td a').each do |a2|
      puts a2['href'] if a2['href'].to_s.index('ed2k:')
    end

  end

end
```



```python
# coding: utf8
import logging

def use_logging(func):

    def wrapper(*args, **kwargs):
        logging.warn("%s is running" % func.__name__)
        return func(*args)
    return wrapper

@use_logging
def foo():
    print("i am foo")

@use_logging
def bar():
    print("i am bar")

if __name__ == '__main__':
	bar()
	foo()
```

