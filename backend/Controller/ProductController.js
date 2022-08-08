import Product from "../Models/ProductModels.js"
import path from 'path'
import fs from 'fs'

export const getProduct = async(req,res) => {
    try {
        const response = await Product.findAll()
        res.json(response)
    } catch (error) {
        console.log(error.message);
    }
    
}

export const getProductById = async(req,res) => {
    try {
        const response = await Product.findOne({
            where :{
                id : req.params.id
            }
        })
        res.json(response)
    } catch (error) {
        console.log(error.message);
    }
}

export const saveProduct = (req,res) => {
    if( req.files === null ) return res.status(400).json({msg : 'no file uploaded'})
    const name = req.body.tittle
    const file = req.files.file
    const fileSize = file.data.length
    const ext = path.extname(file.name)
    const fileName = file.md5 + ext
    const url = `${req.protocol}://${req.get("host")}/image/${fileName}`
    const allowedType = ['.jpg','.png','.jpeg']

    if (!allowedType.includes(ext.toLowerCase())) return res.status(422).json({msg : "invalid img"})

    if(fileSize > 5000000) return res.status(422).json({msg: 'img must be less than 5 mb'})

    file.mv(`./public/image/${fileName}`, async(err) => {
        if (err) return res.status(500).json({msg : err.message})
        try {
            await Product.create({name : name, image : fileName, url : url})
            res.status(201).json({msg : 'product created sukses'})
        } catch (error) {
            console.log(error.message);
        }
    })
}

export const updateProduct = async(req,res) => {
    const product = await Product.findOne({
        where:{
            id : req.params.id
        }
    })

    if(!product) return res.status(404).json({msg : 'no data found'})
    
    let fileName = "";
    if(req.files === null){
        fileName = product.image
        console.log(fileName);
    } else {
        const file = req.files.file
        const fileSize = file.data.length
        const ext = path.extname(file.name)
        fileName = file.md5 + ext
        const allowedType = ['.jpg','.png','.jpeg']

        if(!allowedType.includes(ext.toLowerCase())) return res.status(422).json({msg : "invalid img"})

        if(fileSize > 5000000) return res.status(422).json({msg: 'img must be less than 5 mb'})

        const filePath = `./public/image/${product.image}`
        fs.unlinkSync(filePath)

        file.mv(`./public/image/${fileName}`, (err) => {
            if (err) return res.status(500).json({msg : err.message})
        })
    }

    const name = req.body.tittle
    const url = `${req.protocol}://${req.get("host")}/image/${fileName}`
    console.log(url);

    try {
        await Product.update({name : name, image: fileName, url : url},{
            where:{
                id : req.params.id
            }
        })
        res.status(200).json({msg : 'Product Update Sukses'})
    } catch (error) {
        console.log(error.message);
    }

}


export const deleteProduct = async(req,res) => {
    const product = await Product.findOne({
        where:{
            id : req.params.id
        }
    })

    if(!product) return res.status(404).json({msg : 'no data found'})
    try {
        const filePath = `./public/image/${product.image}`
        fs.unlinkSync(filePath)
        await Product.destroy({
            where:{
                id : req.params.id
            }
        })
        res.status(200).json({msg : 'Product Deleted Sukses'})
    } catch (error) {
        console.log(error.message);
    }
}