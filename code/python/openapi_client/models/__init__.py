# flake8: noqa

# import all models into this package
# if you have many models here with many references from one model to another this may
# raise a RecursionError
# to avoid this, import only the models that you directly need like:
# from from openapi_client.model.pet import Pet
# or import this package, but before doing it, use:
# import sys
# sys.setrecursionlimit(n)

from openapi_client.model.bad_request_foutbericht import BadRequestFoutbericht
from openapi_client.model.bad_request_foutbericht_all_of import BadRequestFoutberichtAllOf
from openapi_client.model.foutbericht import Foutbericht
from openapi_client.model.gewijzigde_personen_hal_collectie import GewijzigdePersonenHalCollectie
from openapi_client.model.gewijzigde_personen_hal_collection_links import GewijzigdePersonenHalCollectionLinks
from openapi_client.model.hal_link import HalLink
from openapi_client.model.invalid_params import InvalidParams
from openapi_client.model.volgindicatie import Volgindicatie
from openapi_client.model.volgindicatie_collectie import VolgindicatieCollectie
from openapi_client.model.volgindicatie_raadplegen import VolgindicatieRaadplegen
from openapi_client.model.volgindicatie_raadplegen_all_of import VolgindicatieRaadplegenAllOf
