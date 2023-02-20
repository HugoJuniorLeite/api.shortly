export function validateSchema(schema) {

    return (req, res, next) => {
      const { error } = schema.validate(req.body, { abortEarly: false });
     // console.log(error)
      if (error) {
        return res.status(500).send(error.details.map((detail) => detail.message));
      }
  
      next();
    };
    
  }
