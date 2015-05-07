xml.instruct!
xml.rss :version => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
 
  xml.channel do
    xml.title 'Socialteering Events'
    xml.description 'A updated list of all the upcoming events at Socialteering'
    xml.link root_url
    xml.language 'en'
    xml.tag! 'atom:link', :rel => 'self', :type => 'application/rss+xml', :href => events_url
 
    for event in @events
      xml.item do
        xml.title event.name
        xml.category event.city
        xml.pubDate(event.created_at.rfc2822)
        xml.link event_url(event)
        xml.guid event_url(event)
        xml.description(h(event.short_description))
        xml.image_url event.image_url
      end
    end
 
  end
 
end