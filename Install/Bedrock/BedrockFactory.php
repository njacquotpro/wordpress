<?php

namespace Install\Bedrock;

class BedrockFactory
{
    public static function install()
    {
        exec('composer create-project roots/bedrock');
    }
}
