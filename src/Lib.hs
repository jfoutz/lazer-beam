--https://viewsourcecode.org/snaptoken/kilo/02.enteringRawMode.html
module Lib
    ( someFunc
    ) where
import System.IO
import System.Posix.Terminal
import System.Posix.IO
import Data.Char
import Data.Bits


enableRawMode = do
  tc <- getTerminalAttributes stdInput
  let te = withoutMode tc EnableEcho
  let tf = withoutMode te ProcessInput
  let tg = withoutMode tf KeyboardInterrupts
  let th = withoutMode tg StartStopOutput
  let ti = withoutMode th ExtendedFunctions
  let tj = withoutMode ti MapCRtoLF
  let tk = withoutMode tj ProcessOutput
  let tl = withoutMode tk InterruptOnBreak
  let tm = withoutMode tl CheckParity
  let tn = withoutMode tm StripHighBit
  let to = withMinInput tn 0
  let tp = withTime to 1
  -- CS8 ? can't find a way to set
  setTerminalAttributes stdInput tp WhenFlushed
  return tc

-- look into external calls to C exceptions, how to catch and how to handle.
disableRawMode tc = do
  setTerminalAttributes stdInput tc WhenFlushed

showState c = do
  if isControl c then
    putStr $ "ctrl:" ++ (show $ ord c) ++ "\r\n"
  else
    putStr $ "chr: " ++ [c] ++ " val:" ++ (show $ ord c) ++ "\r\n"

control_key k = chr $ (ord k) .&. 0x1f

help = do
  done <- hIsEOF stdin
  if done then return ()
    else do
      c <- hGetChar stdin
      if c /= control_key 'q'
        then do
          showState c
          help
        else
        return ()
   
someFunc :: IO ()
someFunc = do
  orig <- enableRawMode
  putStrLn "other stuff"
  putStrLn "last stuff"
  help
  disableRawMode orig
