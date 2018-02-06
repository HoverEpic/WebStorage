#!/usr/bin/python
# -*- coding: utf-8 -*-

import cgi, cgitb, os, sys

upload_dir = os.getenv('UPLOAD_DIR', '/var/www')

def save_uploaded_file():
    print 'Content-Type: application/json; charset=UTF-8'
    print

    form = cgi.FieldStorage()
    if not form.has_key('file'):
        print '{message: "Not found parameter: file", error: true}'
        return

    form_file = form['file']
    if not form_file.file:
        print '{message: "Not found parameter: file", error: true}'
        return

    if not form_file.filename:
        print '{message: "Not found parameter: file", error: true}'
        return

	if not os.path.exists(upload_dir):
		os.makedirs(upload_dir)

    uploaded_file_path = os.path.join(upload_dir, os.path.basename(form_file.filename))
    with file(uploaded_file_path, 'wb') as fout:
        while True:
            chunk = form_file.file.read(100000)
            if not chunk:
                break
            fout.write (chunk)
    print '{message: "Completed file upload", error: false}'

cgitb.enable()
save_uploaded_file()
