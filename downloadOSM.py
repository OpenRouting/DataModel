import sys
import urllib
import urllib2

def download(map_file, extent):
    url = 'http://api.openstreetmap.org/api/0.6/map'

    encoded_url = '{0}?bbox={1}'.format(url, extent)
    print encoded_url
    response = urllib2.urlopen(encoded_url)
    

    with open(output_file, 'w') as writeable:
        writeable.write(response.read())
        
def osm2pgrouting(map_file, config_file, database, username, password):
    osm2pgrouting = 'osm2pgrouting'
    
    upload_command = '{0} -file {1} -conf {2} -dbname {3} -user {4} -passwd {5}'.format(osm2pgrouting, 
                                                                                        map_file,  
                                                                                        config_file,  
                                                                                        database,  
                                                                                        username, 
                                                                                        password)

    upload_response = subprocess.Popen(upload_command, stdout=PIPE).stdout.read()
    
    print upload_response

  
if __name__ == '__main__':
    extent = sys.argv[1]
    map_file = sys.argv[2]
    config_file = sys.argv[3]
    database = sys.argv[4]
    username = sys.argv[5]
    password = sys.argv[6]
    

    if not output_file:
        raise InputError('Output file required')
    if not (extent or len(extent.split(',')) == 4):
        raise InputError('Extent is required in format XMIN,YMIN,XMAX,YMAX')
        
        

    download(extent, map_file)
    osm2pgrouting(map_file, config_file, database, username, password)
