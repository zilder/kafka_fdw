CREATE FOREIGN TABLE kafka_test_junk (
    part int OPTIONS (partition 'true'),
    offs bigint OPTIONS (offset 'true'),
    some_int int,
    some_text text,
    some_date date,
    some_time timestamp,
    junk text OPTIONS (junk 'true'),
    junk_err text OPTIONS (junk_error 'true')
)
SERVER kafka_server OPTIONS
    (format 'csv', topic 'contrib_regress_junk', batch_size '30', buffer_delay '100');

\x on
SELECT * FROM kafka_test_junk WHERE offs>=0 and part=0;