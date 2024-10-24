-- models/metadata_model.sql
select *
from {{ ref('your_metadata_table') }}
