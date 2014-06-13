from .LocalStorageEngine import LocalStorageEngine
from .SwiftStorageEngine import SwiftStorageEngine

StorageEngine = None


def set_engine(engine):
    global StorageEngine
    StorageEngine = engine