module Paths_transmat (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/karun012/.cabal/bin"
libdir     = "/home/karun012/.cabal/lib/x86_64-linux-ghc-7.6.3/transmat-0.1.0.0"
datadir    = "/home/karun012/.cabal/share/x86_64-linux-ghc-7.6.3/transmat-0.1.0.0"
libexecdir = "/home/karun012/.cabal/libexec"
sysconfdir = "/home/karun012/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "transmat_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "transmat_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "transmat_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "transmat_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "transmat_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
