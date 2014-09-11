from .LocalStorageEngine import LocalStorageEngine
from .SwiftStorageEngine import SwiftStorageEngine

_storageengine = None


def set_engine(engine):
    global _storageengine
    _storageengine = engine


def StorageEngine():
    return _storageengine