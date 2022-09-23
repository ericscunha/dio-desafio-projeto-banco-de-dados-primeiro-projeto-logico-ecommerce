-- conecta ao banco
use ecommerce;

-- Dados dos clientes
select
	case c.type_client
		when 'PF' then concat(c.Fname, ' ', c.Minit, ' ', c.Lname) 
        else c.Fname
	end as full_name,
    c.type_client,
    c.email,
    a.address,
    a.zip_code,
    y.name_city,
    y.id_state
from
  clients c
	join address a on
		a.id_client = c.id_client
	join city y on
		y.id_city = a.id_city
where
	a.main_address = 1
order by
  full_name asc;
  
-- Dados de compras por cliente
select
    o.date_order,
    o.id_order,
	case c.type_client
		when 'PF' then concat(c.Fname, ' ', c.Minit, ' ', c.Lname) 
        else c.Fname
	end as full_name,
    c.type_client,
    c.email,
    a.address,
    a.zip_code,
    y.name_city,
    y.id_state,
    o.amount
from
  clients c
	join orders o on
		o.id_client = c.id_client
	join address a on
		a.id_client = o.id_client_address
	join city y on
		y.id_city = a.id_city
where
  o.amount >= 100 and
  o.id_status_order <> 5 -- diferente de cancelado
order by
  full_name asc,
  o.amount desc;
  
-- Quantos pedidos foi feito por cada cliente
select
	case c.type_client
		when 'PF' then concat(c.Fname, ' ', c.Minit, ' ', c.Lname) 
        else c.Fname
	end as full_name,
    count(o.id_order) as qtd_order
from
	clients c
		join orders o on
			o.id_client = c.id_client
where
   o.id_status_order <> 5 -- diferente de cancelado
group by
	full_name;
    
-- Algum vendedor também é fornecedor
select
  s.social_name,
  s.type_client,
  s.document_number,
  s.seller,
  s.supplier
from
	seller_supplier s
where
  s.seller = 1 and  -- É vendedor 
  s.supplier = 1;	-- É forncedor
  
  
-- Relação de Produtos por fornecedor
select
  p.name_product,
  c.name_category,
  e.social_name,
  s.quantity
from
  product p
	join product_supplier s on
		s.id_product = p.id_product
	join seller_supplier e on
		e.id_seller_supplier = s.id_supplier and
        e.supplier = 1
	join category c on
		c.id_category = p.id_category;
        
-- Relação de nome de fornecedor e nomes dos produtos
select
  e.social_name,
  p.name_product,
  c.name_category,
  e.social_name
from
  product p
	join product_supplier s on
		s.id_product = p.id_product
	join seller_supplier e on
		e.id_seller_supplier = s.id_supplier and
        e.supplier = 1
	join category c on
		c.id_category = p.id_category;


-- Produtos mais vendidos
select
	p.id_product,
    p.name_product,
    sum(o.quantity * p.price) as amount
from
  product p
	join product_order o on
      o.id_product = p.id_product
	join orders d on
      d.id_order = o.id_order
where
	d.date_order between '2022-09-01' and '2022-09-20'
group by
	p.id_product,
	p.name_product
having (sum(o.quantity * p.price) > 100)
order by amount desc;
	