import sys
import urllib
import urllib2

if not output_file:
    raise InputError('Output file required')
if not (extent or len(extent.split(',')) == 4):
    raise InputError('Extent is required in format XMIN,YMIN,XMAX,YMAX')


def download(output_file, extent):
    url = 'http://api.openstreetmap.org/api/0.6/map'
    data = {'bbox':extent}

    params = urllib.urlencode(data)
    response = urllib2.urlopen('{0}?{1}'.format(url, urllib.urlencode(data)))

    with open(output_file, 'w') as writeable:
        writeable.write(response.read())
  
if __name__ == '__main__':
    output_file = sys.argv[1]
    extent = sys.argv[2]
    
    download(output_file, extent)
