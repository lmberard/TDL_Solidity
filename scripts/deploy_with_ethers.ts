
// This script can be used to deploy the "Loteria" contract using Web3 library.
// Please make sure to compile "./contracts/1_Loteria.sol" file before running this script.
// And use Right click -> "Run" from context menu of the file to run the script. Shortcut: Ctrl+Shift+S

import { deploy } from './web3.ts'

(async () => {
    try {
        const result = await deploy('Loteria', [])
        console.log(JSON.stringify(result, null, '	')))
        console.log(`address: ${result.address}`)
    } catch (e) {
        console.log(e.message)
    }
})()
