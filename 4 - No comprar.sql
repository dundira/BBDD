SELECT 
    c.idclientes, 
    c.Cli_Nombre
FROM 
    clientes c
LEFT JOIN 
    pedidos p ON c.idclientes = p.Ped_IDCliente
WHERE 
    p.idpedidos IS NULL;  -- Filtramos los clientes sin pedidos (idpedidos será NULL para esos clientes)