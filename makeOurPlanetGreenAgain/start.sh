#!/bin/bash
python3 manage.py migrate && gunicorn --timeout=30 --workers=2 --bind :8000 makeOurPlanetGreenAgain.wsgi:application
