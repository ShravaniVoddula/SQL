/*
    output:
    - start, end dates of different projects
    - order by number of days for completion, start date

    steps:
    1. create leading start date and lagging end date
    2. determine rows for start, continuation and end of the project
    3. only keep start and end rows
    4. combine start and end dates of the project into one row
    5. calculate complete dates
    6. sort table
    */

    with lead_lag as --containg last end, next start dates
    (
        select 
            task_id, 
            start_date,
            lag(end_date, 1) over (order by start_date) as last_end,
            end_date,
            lead(start_date, 1) over (order by start_date) as next_start
        from projects
    ),

    project_dates as -- contains project date types
    (
        select
            start_date,
            end_date,
            case
                -- project start & end date condition (1 day project)
                when (last_end is null or last_end <> start_date)
                    and (next_start <> end_date or next_start is null) then 'start end'
                -- project start date condition
                when last_end is null or last_end <> start_date then 'start'
                -- project continuation date condition
                when last_end = start_date and end_date = next_start then 'con'
                -- project end date condition
                when last_end = start_date or next_start <> end_date 
                    or next_start is null then 'end'
            end as 'type'
        from lead_lag
    ),

    project_end_date as -- contains project end dates
    (
        select
            start_date,
            end_date,
            type,
            case
                -- if next row is project end date, show that day's end date
                when lead(type, 1) over (order by start_date) = 'end' then lead(end_date, 1) over (order by start_date)
                -- if current row is 1 day project, show this row's end date
                when type = 'start end' then end_date
                else null
            end as project_end_date
        from project_dates
        where type <> 'con'
    )

    select
      start_date as project_start_date,
      project_end_date
    from project_end_date
    where project_end_date is not null
    order by datediff(day, start_date, project_end_date), start_date
