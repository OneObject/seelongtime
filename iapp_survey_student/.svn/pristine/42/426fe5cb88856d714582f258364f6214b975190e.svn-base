--修改授权视图，添加域授权--
ALTER view v_authorize
AS
select au.id,au.rcategory,au.rid,au.scategory,au.domain,au.sid as uid from iapp_base_authorize au
where scategory='1'
UNION
select au.id,au.rcategory,au.rid,au.scategory,au.domain,u.id as uid from iapp_base_authorize au
left join iapp_base_user u on au.sid=u.oid
where scategory='2'
UNION
select au.id,au.rcategory,au.rid,au.scategory,au.domain,u.id as uid from iapp_base_authorize au
left join iapp_base_user u on au.sid=u.domain
where scategory='3'
UNION
select au.id,au.rcategory,au.rid,au.scategory,au.domain,u.userid as uid from iapp_base_authorize au
left join iapp_base_userlinkjoblevel u on au.sid=u.userid
where scategory='4'