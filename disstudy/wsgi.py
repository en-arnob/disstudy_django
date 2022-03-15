# @Author: arnob
# @Date:   2020-06-25T21:51:59+06:00
# @Last modified by:   arnob
# @Last modified time: 2020-06-28T03:11:33+06:00



"""
WSGI config for disstudy project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/3.0/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'disstudy.settings')

application = get_wsgi_application()
