import os
from web3 import Web3
from solcx import install_solc
from dotenv import load_dotenv

from scripts.interact import ContractInteractor
from scripts.compile import compile_solidity, get_contract_data
from scripts.deploy import deploy_contract


load_dotenv()

def compile_and_deploy(provider):
    install_solc(version=os.getenv('SOLIDITY_VERSION'))
    compiled = compile_solidity(os.getenv('SOL_PATH'), os.getenv('SOLIDITY_VERSION'))
    abi, bytecode = get_contract_data(compiled, os.getenv('CONTRACT_NAME'))
    address = deploy_contract(abi, bytecode, provider)
    interactor = ContractInteractor(address, abi, provider)
    return interactor


def init():
    w3 = Web3(Web3.HTTPProvider(os.getenv('RPC_URL')))
    print(f"Connected: {w3.is_connected()}")
    interactor = compile_and_deploy(w3)
    return interactor