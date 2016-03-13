'''
import avro.schema
from avro.datafile import DataFileReader, DataFileWriter
from avro.io import DatumReader, DatumWriter
reader = DataFileReader(open("data.avro", "r"), DatumReader())
for user in reader:
    print user
reader.close()
'''
from avro import schema, datafile, io
import pprint
 
OUTFILE_NAME = 'data.avro'
rec_reader = io.DatumReader()
 
df_reader = datafile.DataFileReader(
    open(OUTFILE_NAME),
    rec_reader
)
# Read all records stored inside
pp = pprint.PrettyPrinter()
 
for record in df_reader:
    pp.pprint(record)
