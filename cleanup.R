# Clean up everything
# Clean the environment
rm(list=ls())
# Close the current graphics device if necessary
if (dev.cur() > 1) dev.off()
