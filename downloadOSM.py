import sys
import urllib
import urllib2
import subprocess
from subprocess import Popen, PIPE


def download(map_file, extent):
    url = 'http://api.openstreetmap.org/api/0.6/map'

    encoded_url = '{0}?bbox={1}'.format(url, extent)
    print encoded_url
    response = urllib2.urlopen(encoded_url)
    

    with open(map_file, 'w') as writeable:
        writeable.write(response.read())
        
def osm2pgrouting(map_file, config_file, database, username, password):
    osm2pgrouting = 'osm2pgrouting'
    
    upload_command = 'osm2pgrouting -file {0} -conf {1} -dbname {2} -user {3} -passwd {4}'.format(map_file,  
                                                                                        config_file,  
                                                                                        database,  
                                                                                        username, 
                                                                                        password)
    print upload_command
    subprocess.call(upload_command)
    #upload_response = subprocess.Popen(upload_command, stdout=PIPE)
    #output, errors = upload_response.communicate()
    
    print output

def osm2pgsql(map_file, style_file, database, username, password):
    upload_command = 'osm2pgsql'
    hostname = 'localhost'
    upload_command = '{0} -c -d {1} -U {2} -H {3} -S {4} {5}'.format(upload_command, database, username, hostname, style_file, map_file)
    
    print upload_command
    subprocess.call(upload_command)
    #output, errors = upload_response.communicate()
    
    #print output
  
if __name__ == '__main__':

    extent = sys.argv[1]
    map_file = sys.argv[2]
    config_file = sys.argv[3]
    style_file = sys.argv[4]
    database = sys.argv[5]
    username = sys.argv[6]
    password = sys.argv[7]
    

    if not map_file:
        raise InputError('Output file required')
    if not (extent or len(extent.split(',')) == 4):
        raise InputError('Extent is required in format XMIN,YMIN,XMAX,YMAX')
        
    print extent, map_file, config_file, style_file


    #download(map_file, extent)
    #osm2pgrouting(map_file, config_file, database, username, password)
    osm2pgsql(map_file, style_file, database, username, password)
