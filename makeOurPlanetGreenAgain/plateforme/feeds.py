from django.contrib.syndication.views import Feed
from django.utils.feedgenerator import Rss201rev2Feed

from .models import Projet
from projet.models import Projet
from time import gmtime, strftime

class CorrectMimeTypeFeed(Rss201rev2Feed):
    mime_type = 'application/xml'

class ProjectsFeed(Feed):
    feed_type = CorrectMimeTypeFeed
    title = "Greenagain projetcs"
    link = "/"
    description = "Updates on new projects on green again entry."
    pub_date = strftime("%Y-%m-%d %H:%M:%S", gmtime())

    def items(self):
        return Projet.objects.all().order_by("-publication_date")[:5]

    def item_title(self, item):
        return item.nom

    def item_description(self, item):
        return item.description

    def item_link(self, item):
        return '/projets/'+str(item.id)+'/'

    def __call__(self, request, *args, **kwargs):
        response = super(ProjectsFeed, self).__call__(request, *args, **kwargs)

        # Add stylesheet, is it worth it?
        css = b'<?xml-stylesheet type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" ?>\n'
        start = b'<rss xmlns:atom'
        response.content = response.content.replace(start, css + start)

        return response