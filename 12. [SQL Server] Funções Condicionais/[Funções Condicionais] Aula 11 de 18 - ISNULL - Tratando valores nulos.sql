--ISNULL : tratando valores nulos
--ISNULL pede dois argumentos 1> expresão para verifica o valaor se null ou não, e a alternativa

select
	GeographyKey,
	ContinentName,
	CityName,
	ISNULL(CityName, 'Local Desconhecido') as 'Cite'
from DimGeography