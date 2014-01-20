# gcc -o adam-c-test adam-c-test.c -I../../avro-c-1.7.5/src -L../../avro-c-1.7.5/build/src/ -lavro

#include <avro.h>
#include <stdio.h>
#include <stdlib.h>

#ifdef DEFLATE_CODEC
#define QUICKSTOP_CODEC  "deflate"
#else
#define QUICKSTOP_CODEC  "null"
#endif

avro_schema_t adam_record_schema;

long flength(FILE* fd) {
  fseek(fd, 0L, SEEK_END);
  long sz = ftell(fd);
  fseek(fd, 0L, SEEK_SET);
  return sz;
}
/* Parse schema into a schema data structure */
void init_adam_schema(const char* adam_avpr_file)
{
  FILE* fd = fopen(adam_avpr_file, "r");
  if (fd == NULL) {
    fprintf(stderr, "unable to open schema file: %s", adam_avpr_file);
    exit(-1);
  }
  long buffer_length = flength(fd);
  char* schema_json = (char*) malloc(buffer_length + 1);
  if (schema_json == NULL) {
    fprintf(stderr, "memory allocation failure: %d", errno);
    exit(-1);
  }
  long bytes_read = 0;
  while (bytes_read != buffer_length && !feof(fd)) {
    bytes_read += fread(schema_json + bytes_read, 1, buffer_length, fd);
  }
  if (bytes_read != buffer_length) {
    fprintf(stderr, "could not read entire file\n");
    exit(-1);
  }
  //  schema_json[buffer_length] = '\0';
  if (avro_schema_from_json_length(schema_json, bytes_read, &adam_record_schema)) {
    fprintf(stderr, "Unable to parse ADAM schema\n");
    fprintf(stderr, "%s\n", schema_json);
    fprintf(stderr, "%s\n", avro_strerror());
    exit(EXIT_FAILURE);
  }
}

int main(void)
{
  int rval;
  const char *schema_fn = "adam.aspr";

  /* Initialize the schema structure from JSON */
  init_adam_schema(schema_fn);
}
