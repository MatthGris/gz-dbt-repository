{% snapshot products_snapshot %}

{{
    config(
        target_schema='dbt_snapshots',  -- Schema where the snapshot data will be stored
        unique_key='products_id',       -- Unique key to identify each record
        strategy='check',               -- Use the 'check' strategy to detect changes
        check_cols='all'                -- Track changes in all columns of the table
    )
}}

-- Query to select the data to snapshot (using ref to reference the staging model)
select * from {{ ref("stg_raw__product") }}

{% endsnapshot %}
