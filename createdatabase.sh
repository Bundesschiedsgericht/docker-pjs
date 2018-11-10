#!/bin/bash

su -c 'createuser --username=postgres --no-superuser --pwprompt piratejusticestatus' postgres
su -c 'createdb --username=postgres --owner=piratejusticestatus --encoding=UNICODE piratejusticestatus' postgres

