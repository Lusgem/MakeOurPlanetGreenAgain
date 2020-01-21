import json

from django import template


register = template.Library()

@register.simple_tag(takes_context = True)
def cookie(context, cookie_name): # could feed in additional argument to use as default value
    request = context['request']
    result = request.COOKIES.get(cookie_name)# I use blank as default value
    return json.loads(result.replace('\'','\"'))

@register.simple_tag(takes_context=True)
def subtractify(context, obj):
    newval = obj.montant - obj.financement
    return newval