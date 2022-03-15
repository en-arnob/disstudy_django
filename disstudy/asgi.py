# @Author: arnob
# @Date:   2020-06-25T21:51:59+06:00
# @Last modified by:   arnob
# @Last modified time: 2020-06-28T03:11:21+06:00



"""
ASGI config for disstudy project.

It exposes the ASGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/3.0/howto/deployment/asgi/
"""

import os

from django.core.asgi import get_asgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'disstudy.settings')

application = get_asgi_application()
