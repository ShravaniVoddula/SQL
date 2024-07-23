select w.id, wp.age, w.coins_needed, w.power 
from wands w 
join wands_property wp 
on w.code=wp.code 
where coins_needed = (select min(w1.coins_needed) 
                       from wands w1 
                       join wands_property wp1 
                       on w1.code=wp1.code 
                       where is_evil =0 and w1.power=w.power and wp1.age = wp.age) 
order by power desc, age desc;
