<?php
/**
 * This file is part of workerman.
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the MIT-LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @author    walkor<walkor@workerman.net>
 * @copyright walkor<walkor@workerman.net>
 * @link      http://www.workerman.net/
 * @license   http://www.opensource.org/licenses/mit-license.php MIT License
 */
namespace Workerman\Connection;

use Workerman\Events\EventInterface;
use Workerman\Worker;
use Exception;

/**
 * AsyncTcpConnection.
 */
class AsyncUdpConnection extends UdpConnection
{
    /**
     * Construct.
     *
     * @param string $remote_address
     * @throws Exception
     */
    public function __construct($remote_address)
    {
        // Get the application layer communication protocol and listening address.
        list($scheme, $address) = explode(':', $remote_address, 2);
        // Check application layer protocol class.
        if ($scheme !== 'udp') {
            $scheme         = ucfirst($scheme);
            $this->protocol = '\\Protocols\\' . $scheme;
            if (!class_exists($this->protocol)) {
                $this->protocol = "\\Workerman\\Protocols\\$scheme";
                if (!class_exists($this->protocol)) {
                    throw new Exception("class \\Protocols\\$scheme not exist");
                }
            }
        }
        
        $this->_remoteAddress = substr($address, 2);
        $this->_socket = stream_socket_client("udp://{$this->_remoteAddress}");
        Worker::$globalEvent->add($this->_socket, EventInterface::EV_READ, array($this, 'baseRead'));
    }
    
    /**
     * For udp package.
     *
     * @param resource $socket
     * @return bool
     */
    public function baseRead($socket)
    {
        $recv_buffer = stream_socket_recvfrom($socket, Worker::MAX_UDP_PACKAGE_SIZE, 0, $remote_address);
        if (false === $recv_buffer || empty($remote_address)) {
            return false;
        }
        
        if ($this->onMessage) {
            if ($this->protocol) {
                $parser      = $this->protocol;
                $recv_buffer = $parser::decode($recv_buffer, $this);
            }
            ConnectionInterface::$statistics['total_request']++;
            try {
                call_user_func($this->onMessage, $this, $recv_buffer);
            } catch (\Exception $e) {
                self::log($e);
                exit(250);
            } catch (\Error $e) {
                self::log($e);
                exit(250);
            }
        }
        return true;
    }
    
    
    /**
     * Close connection.
     *
     * @param mixed $data
     * @return bool
     */
    public function close($data = null, $raw = false)
    {
        if ($data !== null) {
            $this->send($data, $raw);
        }
        Worker::$globalEvent->del($this->_socket, EventInterface::EV_READ);
        fclose($this->_socket);
        return true;
    }
    
}
