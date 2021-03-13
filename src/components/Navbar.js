import React, { Component } from 'react';

class Navbar extends Component {

  render() {
    return (
      <nav className="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
        
        <a
          className="navbar-brand col-sm-3 col-md-2 mr-0"
          href="https://github.com/vmieres/Blockchain_Marketplace"
          target="_blank"
          rel="noopener noreferrer"
        >
          <img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTdYQuoaDP0HZQEflpPD8N27xYttkjOUvBKQ&usqp=CAU'  alt="" border="3" height="40" width="40"></img>
          <span>  </span>
          CryptoPuppies Marketplace
        </a>
        <ul className="navbar-nav px-3">
          <li className="nav-item text-nowrap d-none d-sm-none d-sm-block">
            <div><small className="text-white"><span id="account">Your Address: {this.props.account}</span></small></div>
            <div><small className="text-white"><span id="contract">Contract Address: {this.props.contract}</span></small></div>
          </li>
        </ul>
      </nav>
    );
  }
}

export default Navbar;
